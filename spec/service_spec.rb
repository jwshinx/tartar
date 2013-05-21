require 'spec_helper'

#require File.dirname(__FILE__) + '/../lib' 
#require 'spec'
#require 'spec/interop/test'
#require 'rack/test'

#set :environment, :test
#Test::Unit::TestCase.send :include, Rack::Test::Methods

#def app
# Sinatra::Application
#end

describe "service" do
 describe "GET on /x/y/:id" do
  it "lsls" do
   'joel'.should be_true
   puts "----> joel shin"
   puts "----> #{File.dirname(__FILE__)}"
   x = Dog.new
  end
  it "get" do
   get '/'
   last_response.should be_ok
   last_response.body.should match(/Hello Oakland!!!!/)
   last_response.status.should == 200 
   puts "---> last_res: #{last_response.inspect}"
   #attributes = JSON.parse(last_response.body)
   #attributes["name"].should == 'joel'
  end
 end
end
