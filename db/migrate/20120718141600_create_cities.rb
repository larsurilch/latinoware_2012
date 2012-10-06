# encoding: utf-8

class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name
      t.string :abbreviation
      t.references :state
    end
    
    add_index :cities, :state_id
  
  end
end