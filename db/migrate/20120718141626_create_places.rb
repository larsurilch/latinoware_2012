# encoding: utf-8

class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :description, :limit => 35, :null => false
      t.timestamps
    end
    
    # Place.create :description => "Caixa d'água"
    # Place.create :description => "Tanque"
    # Place.create :description => "Depósitos de barro"
    # Place.create :description => "Depósitos de madeira"
    # Place.create :description => "Pneus"
    # Place.create :description => "Recipientes naturais"
    # Place.create :description => "Cacimbas, poços e cisternas"
    # Place.create :description => "Outros"
    
  end
end