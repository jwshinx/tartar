#require 'spec_helper'
#require 'client_spec_helper'
require File.join(File.dirname(__FILE__), '..', 'client.rb')

describe "client" do
 before(:each) { Customer.base_uri = "http://localhost:3000" }
 
 it "should get a customer" do
  puts "---> xxx: #{File.dirname(__FILE__).to_s}"
  puts "---> yyy: #{__FILE__.to_s}"
  cust = Customer.first
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
  first_id = Customer.first['customer']['id']
  customer = Customer.update(first_id, { name: 'Bbarrack' })
  customer['customer']['name'].should == 'Bbarrack'
  Customer.find_by_id( customer['customer']['id'] ).should == customer
  customer = Customer.update(first_id, { name: 'Barack' })
 end

 it "should destroy a customer" do
  customer = Customer.create( { name: 'Jimi Hendrix' })
  #puts "---> 1. #{customer.inspect}"
  id = customer['customer']['id']
  #puts "---> 2. #{id}"
  #customer = Customer.find_by_id( id )
  Customer.destroy(id).should == true
  Customer.find_by_id( id ).should be_nil
 end
end
