class CreateInspections < ActiveRecord::Migration
  def change
    create_table :inspections do |t|
      t.string :transmitter, :limit => 15, :null => false
      t.integer :code, :null => false
      t.string :enrollment, :limit => 15, :null => false
      t.string :agent, :limit => 35, :null => false
      t.string :gender, :limit => 1, :null => false
      t.date :inspection_date, :null => false
      t.text :comments
      t.references :area, :null => false
      t.references :place, :null => false
      t.references :state, :null => false
      t.references :city, :null => false
      t.point :the_geom, :geographic => true, :null => false
      t.timestamps
    end
    
    add_index :inspections, :area_id
    add_index :inspections, :place_id
    add_index :inspections, :state_id
    add_index :inspections, :city_id
  end
end