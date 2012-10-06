class City < ActiveRecord::Base
  default_scope order('name ASC')
  
  belongs_to :state
  
  has_many :inspections
  
  attr_accessible :abbreviation, :name, :state_id
end