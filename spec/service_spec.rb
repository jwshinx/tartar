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

describe "services" do
 describe "GET on /customers/:id" do
  before { @c = Customer.create( name: 'Bob Dylan' ) }
  it "returns customer by :id" do
   get "/customers/#{@c.id}"
   last_response.should be_ok 
   attributes = JSON.parse(last_response.body)
   attributes["customer"]["name"].should == 'Bob Dylan'
  end
  it "returns 404 when customer doesn't exist" do
   get "/customers/98884"
   last_response.status.should == 404
  end
 end
end

describe "at root" do
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
