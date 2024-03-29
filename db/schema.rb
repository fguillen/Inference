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

ActiveRecord::Schema.define(:version => 20130113184540) do

  create_table "dashboard_lattices", :force => true do |t|
    t.integer  "dashboard_id",                :null => false
    t.integer  "widget_id",                   :null => false
    t.integer  "position",     :default => 0
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  add_index "dashboard_lattices", ["dashboard_id"], :name => "index_dashboard_lattices_on_dashboard_id"
  add_index "dashboard_lattices", ["widget_id"], :name => "index_dashboard_lattices_on_widget_id"

  create_table "dashboards", :force => true do |t|
    t.string   "name",                          :null => false
    t.integer  "minutes_ago", :default => 1440
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "widgets", :force => true do |t|
    t.string   "name",                          :null => false
    t.text     "script",                        :null => false
    t.integer  "minutes_ago", :default => 1440
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.text     "text"
  end

end
