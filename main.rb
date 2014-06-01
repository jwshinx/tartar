#require File.join(File.dirname(__FILE__), '..', 'client.rb')
$LOAD_PATH << File.expand_path('..', __FILE__)
#require 'customer'
#require File.join(File.dirname(__FILE__), '..', 'services.rb')

require 'client'

puts "\n---> lets get a customer"

begin
 #cust = Customer.find_by_id 3
 #puts "#{cust.inspect}"
 puts "1. #{Customer.ancestors}"
 puts "2. #{Customer.methods.inspect}"
 Customer.base_uri = 'xxx'
 puts "3. #{Customer.base_uri}"
rescue => e
 puts "ERROR!!!! #{e.inspect}"
end

