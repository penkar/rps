require 'sinatra'
require 'rack-flash'

class RPS::Server < Sinatra::Application

  configure do
    use Rack::Session::Cookie, :key => 'rack.session',
                               :path => '/',
                               :expire_after => 360, # a year in seconds
                               :secret => 'my secret'
    use Rack::Flash
  end

	get '/' do
		erb :index
	end

	get '/signup' do
		erb :signup
	end

	post '/signup' do
		if params['username'].empty? || params['password'].empty? || params['password_conf'].empty?
			redirect to '/signup'
		end
		if RPS::User.find_by(username: params['username'])
			'Username has been taken, please select a new username.'
		elsif params['password'] == params['password_conf']
			user = RPS::User.new
			user.username = params['username']
			user.email=params['email']
			user.wins = 0
			user.losses = 0
			user.ties = 0
			user.total_games = 0
			user.password_digest = params['password']
			user.save
		else
			flash[:alert] = 'Password Conformity Not Valid. Revalidate.'
			redirect to '/signup'
		end
	end

	get '/signin' do
		erb :signin
	end

	post '/signin' do
		if params['username'].empty? || params['password'].empty?
			flash[:alert] = 'Username && || Password empty'
			redirect to '/signup'
		end

		user = RPS::User.find_by(username: params['username'])
		if user && user.has_password?(params['password'])
			redirect to '/gamehome'
		else
			flash[:alert]='Username && || Password invalid'
			redirect to '/signin'
		end
	end

	get '/gamehome' do
		erb :gamehome
	end

end