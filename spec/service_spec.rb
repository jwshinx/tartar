require 'spec_helper'

#require File.dirname(__FILE__) + '/../lib' 
#$LOAD_PATH << File.expand_path('../models', __FILE__)
#require 'customer'
#require 'spec'
#require 'spec/interop/test'
#require 'rack/test'

#set :environment, :test
#Test::Unit::TestCase.send :include, Rack::Test::Methods

#def app
# Sinatra::Application
#end

describe "service" do
 describe "GET on /api/v1/customers/:id" do
  it "xxx" do
   c = Customer.create( { name: 'Brad Pitt' } )
   c.to_s.should == "Name: Brad Pitt"
   c.name.should == "Brad Pitt"
   c.should be_true
  end
 end
 describe "GET on /" do
  it "should return *Hello Oakland*" do
   get '/'
   last_response.should be_ok
   last_response.body.should match(/Hello Oakland!!!!/)
   last_response.status.should == 200 
   #attributes = JSON.parse(last_response.body)
   #attributes["name"].should == 'joel'
  end
 end
end
