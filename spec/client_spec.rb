#require 'spec_helper'
#require 'client_spec_helper'
require File.join(File.dirname(__FILE__), '..', 'client.rb')

describe "client" do
 before(:each) { Customer.base_uri = "http://localhost:3000" }
 
 it "should get a customer" do
  cust = Customer.find_by_id( 26 )
  cust['customer']['name'].should == 'Barack'
 end

 it "should return nil for a customer not found" do
  Customer.find_by_id( 332 ).should be_nil 
 end

 it "should create a customer" do
  customer = Customer.create( { name: 'John Lennon' })
  customer['customer']['name'].should == 'John Lennon'
  Customer.find_by_id( customer['customer']['id'] ).should == customer
 end

 it "should update a customer" do
  customer = Customer.update(26, { name: 'Bbarrack' })
  customer['customer']['name'].should == 'Bbarrack'
  Customer.find_by_id( customer['customer']['id'] ).should == customer
  customer = Customer.update(26, { name: 'Barack' })
 end

end
