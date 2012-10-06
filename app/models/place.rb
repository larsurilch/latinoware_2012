class Place < ActiveRecord::Base
  default_scope order('description ASC')
  
  attr_accessible :description
  
  has_many :inspections
  
  validates :description, :presence => true, :length => { :within =>  4..35 }
end