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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180323041521) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "characters", force: :cascade do |t|
    t.string   "type"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "game_id"
  end

  create_table "games", force: :cascade do |t|
    t.string   "code"
    t.boolean  "active"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.jsonb    "special_bad",  default: []
    t.jsonb    "special_good", default: []
    t.integer  "bad_number",   default: 2,  null: false
    t.integer  "owner_id"
  end

  create_table "light_settings", force: :cascade do |t|
    t.boolean "lights_on",        default: false
    t.integer "brightness_level", default: 100
    t.integer "red_value",        default: 100
    t.integer "blue_value",       default: 100
    t.integer "green_value",      default: 100
  end

end
