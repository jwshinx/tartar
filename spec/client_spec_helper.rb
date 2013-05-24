#require 'factory_girl'
#$LOAD_PATH << File.expand_path('..', __FILE__)
require File.join(File.dirname(__FILE__), '..', 'client.rb')
set :environment, :test
set :run, false
set :raise_errors, true
set :logging, false

def app
  Sinatra::Application
end

RSpec.configure do |config|
  config.include Rack::Test::Methods
end

#FactoryGirl.find_definitions

