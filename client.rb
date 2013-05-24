require 'rubygems'
require 'typhoeus'
require 'json'

class Customer
 class << self 
  attr_accessor :base_uri
 end

 def sayhi
  'hi'
 end

 def self.find_by_id( id )
  response = Typhoeus::Request.get( "#{base_uri}/customers/#{id}" )
  if response.code == 200
   JSON.parse( response.body )
  elsif response.code == 404
   nil
  else
   raise response.body
  end
 end

 def self.create( attributes )
  response = Typhoeus::Request.post( "#{base_uri}/customers", :body => attributes.to_json )
  if response.code == 200
   JSON.parse( response.body )
  else
   raise response.body
  end
 end

 def self.update(id, attributes )
  response = Typhoeus::Request.put( "#{base_uri}/customers/#{id}", :body => attributes.to_json )
  if response.code == 200
   JSON.parse( response.body )
  else
   raise response.body
  end
 end

end
