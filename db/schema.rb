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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150509142815) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.integer "user_id",                     null: false
    t.string  "description"
    t.string  "street_address"
    t.string  "secondary_address"
    t.string  "city",                        null: false
    t.string  "state",             limit: 2, null: false
    t.string  "zip_code",                    null: false
  end

  create_table "parcels", force: :cascade do |t|
    t.integer  "origin_address_id",      null: false
    t.integer  "destination_address_id", null: false
    t.integer  "sender_id",              null: false
    t.integer  "trip_id"
    t.datetime "pickup_by",              null: false
    t.datetime "deliver_by",             null: false
    t.integer  "weight"
    t.integer  "volume",                 null: false
    t.text     "delivery_notes"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "trip_id"
    t.integer  "parcel_id"
    t.integer  "reviewer_id", null: false
    t.integer  "reviewee_id", null: false
    t.integer  "rating",      null: false
    t.text     "content",     null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "trips", force: :cascade do |t|
    t.integer  "origin_address_id",                              null: false
    t.integer  "destination_address_id",                         null: false
    t.integer  "driver_id",                                      null: false
    t.datetime "leaving_at",                                     null: false
    t.datetime "arriving_at",                                    null: false
    t.integer  "available_volume",                               null: false
    t.integer  "max_weight"
    t.decimal  "rate",                   precision: 8, scale: 2, null: false
    t.text     "content_restrictions"
    t.string   "vehicle"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",        limit: 50, null: false
    t.string   "password_digest",            null: false
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
