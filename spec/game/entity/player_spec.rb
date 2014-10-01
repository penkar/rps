require_relative '../../spec_helper.rb'
require 'pry-byebug'

describe RPS::User do 
	it 'Should be able to create an active User.' do
		a = RPS::User.new
		a.username = 'Jack Bauer'
		a.email = 'jb@CTU.gov'
		a.save
		expect(a.id).to be_a(Fixnum)
	end
end