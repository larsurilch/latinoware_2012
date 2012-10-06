# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120718141706) do

  create_table "areas", :force => true do |t|
    t.string   "description", :limit => 60, :null => false
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "cities", :force => true do |t|
    t.string  "name"
    t.string  "abbreviation"
    t.integer "state_id"
  end

  add_index "cities", ["state_id"], :name => "index_cities_on_state_id"

  create_table "inspections", :force => true do |t|
    t.string   "transmitter",     :limit => 15,                                               :null => false
    t.integer  "code",                                                                        :null => false
    t.string   "enrollment",      :limit => 15,                                               :null => false
    t.string   "agent",           :limit => 35,                                               :null => false
    t.string   "gender",          :limit => 1,                                                :null => false
    t.date     "inspection_date",                                                             :null => false
    t.text     "comments"
    t.integer  "area_id",                                                                     :null => false
    t.integer  "place_id",                                                                    :null => false
    t.integer  "state_id",                                                                    :null => false
    t.integer  "city_id",                                                                     :null => false
    t.spatial  "the_geom",        :limit => {:srid=>4326, :type=>"point", :geographic=>true}, :null => false
    t.datetime "created_at",                                                                  :null => false
    t.datetime "updated_at",                                                                  :null => false
  end

  add_index "inspections", ["area_id"], :name => "index_inspections_on_area_id"
  add_index "inspections", ["city_id"], :name => "index_inspections_on_city_id"
  add_index "inspections", ["place_id"], :name => "index_inspections_on_place_id"
  add_index "inspections", ["state_id"], :name => "index_inspections_on_state_id"

  create_table "places", :force => true do |t|
    t.string   "description", :limit => 35, :null => false
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "states", :force => true do |t|
    t.string "name", :limit => 35, :null => false
  end

end
