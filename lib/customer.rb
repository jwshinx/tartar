require 'active_record'

class Customer < ActiveRecord::Base
 attr_accessible :name
 validates :name, :presence => true

 def to_s
  "Name: #{@name}"
 end
end
