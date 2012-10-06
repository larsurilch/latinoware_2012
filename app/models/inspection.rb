class Inspection < ActiveRecord::Base
  set_rgeo_factory_for_column(:the_geom, RGeo::Geographic.spherical_factory(:srid => 4326))
  
  belongs_to :area
  belongs_to :place
  belongs_to :state
  belongs_to :city
  
  attr_accessible :agent, :code, :comments, :enrollment, :gender, :inspection_date, :the_geom, :transmitter, :area_id, :place_id, :state_id, :city_id
  
  validates :agent, :presence => true, :length => { :within =>  4..35 }
  validates :code, :numericality => { :only_integer => true }, :length => { :maximum => 5 }
  validates :enrollment, :transmitter, :presence => true, :length => { :within =>  4..15 }
  validates :gender, :presence => true, :inclusion => { :in => %w(M F)}
  validates :inspection_date, :presence => true
  validates :the_geom, :presence => true
  validates :transmitter, :presence => true
  validates :area, :place, :state, :city, :presence => true
end