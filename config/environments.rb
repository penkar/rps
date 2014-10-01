require 'active_record'
require 'active_record_tasks'
require_relative '../lib/rps.rb' # the path to your application file

if ENV['APP_ENV'] == 'development'
  ActiveRecord::Base.establish_connection(
    :adapter => 'postgresql',
    :database => 'rps_dev'
  )
elsif ENV['APP_ENV'] == 'test'
  ActiveRecord::Base.establish_connection(
    :adapter => 'postgresql',
    :database => 'rps_test'
  )
end

