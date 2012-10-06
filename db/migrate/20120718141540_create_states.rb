# encoding: utf-8

class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :name, :limit => 35, :null => false
    end
  end
end