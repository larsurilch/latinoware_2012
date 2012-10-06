class State < ActiveRecord::Base
  default_scope order('name ASC')
  
  attr_accessible :name
  
  has_many :cities
  has_many :inspections
end