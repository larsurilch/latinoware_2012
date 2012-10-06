# encoding: utf-8

class CreateAreas < ActiveRecord::Migration
  def change
    create_table :areas do |t|
      t.string :description, :limit => 60, :null => false
      t.timestamps
    end
    
    # Area.create :description => "Não infestada"
    # Area.create :description => "Infestada sem transmissão de dengue"
    # Area.create :description => "Com história prévia de transmissão de dengue"
    
  end
end