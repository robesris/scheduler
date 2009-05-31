# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090531203457) do

  create_table "character_raid", :id => false, :force => true do |t|
    t.integer "character_id", :null => false
    t.integer "raid_id",      :null => false
  end

  create_table "character_role", :id => false, :force => true do |t|
    t.integer "character_id", :null => false
    t.integer "role_id",      :null => false
  end

  create_table "characters", :force => true do |t|
    t.string   "name"
    t.integer  "faction_id"
    t.integer  "race_id"
    t.integer  "class_id"
    t.integer  "level"
    t.integer  "gear_score"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "expansions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "instance_names", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "instances", :force => true do |t|
    t.integer  "instance_name_id"
    t.integer  "size"
    t.integer  "expansion_id"
    t.integer  "level"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "raids", :force => true do |t|
    t.integer  "instance_id"
    t.datetime "raid_time"
    t.string   "code"
    t.string   "password"
    t.boolean  "searchable"
    t.boolean  "protected"
    t.integer  "creator_id"
    t.integer  "min_gear_level"
    t.integer  "tanks"
    t.integer  "heals"
    t.integer  "dps"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "raid_end_time"
    t.integer  "realm_id"
  end

  create_table "realms", :force => true do |t|
    t.string   "name"
    t.integer  "region_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "regions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "role_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
