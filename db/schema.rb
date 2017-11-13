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

ActiveRecord::Schema.define(version: 20171110220450) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "inbounds", force: :cascade do |t|
    t.string "airline", null: false
    t.datetime "arrival", null: false
    t.datetime "departure", null: false
    t.string "airport", null: false
    t.integer "travelgrouping_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "outbounds", force: :cascade do |t|
    t.string "airline", null: false
    t.datetime "arrival", null: false
    t.datetime "departure", null: false
    t.string "airport", null: false
    t.integer "travelgrouping_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "receipts", force: :cascade do |t|
    t.decimal "total", null: false
    t.string "store", null: false
    t.integer "trip_id"
    t.integer "purchaser_id"
    t.string "photo_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "travelgroupings", force: :cascade do |t|
    t.integer "trip_id"
    t.integer "traveller_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trips", force: :cascade do |t|
    t.string "name", null: false
    t.string "location", null: false
    t.decimal "budget", null: false
    t.integer "organizer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "phone_number", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
