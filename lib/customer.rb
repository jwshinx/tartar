require 'active_record'

class Customer < ActiveRecord::Base
 attr_accessor :name
 validates :name, :presence => true

 def to_s
  "Name: #{@name}"
 end
end
