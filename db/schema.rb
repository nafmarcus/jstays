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

ActiveRecord::Schema.define(version: 20131006232156) do

  create_table "available_dates", force: true do |t|
    t.integer "property_id"
    t.date    "a_date"
    t.string  "level"
  end

  add_index "available_dates", ["property_id"], name: "index_available_dates_on_property_id"

  create_table "properties", force: true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "description"
    t.string   "property_type",        default: "apartment"
    t.string   "sharing",              default: "exclusive"
    t.string   "duration",             default: "short_term"
    t.string   "currency"
    t.float    "other_expenses"
    t.string   "country"
    t.string   "state"
    t.string   "city"
    t.string   "zip"
    t.text     "address"
    t.float    "latitude"
    t.float    "longitude"
    t.float    "lat"
    t.float    "long"
    t.string   "floor"
    t.float    "bedrooms"
    t.float    "bathrooms"
    t.integer  "sleeps"
    t.boolean  "kosher"
    t.text     "amenities"
    t.text     "comments1"
    t.text     "comments2"
    t.string   "video_link"
    t.boolean  "active"
    t.float    "rate_long_term"
    t.float    "rate_daily_regular"
    t.float    "rate_daily_high"
    t.float    "rate_weekly_regular"
    t.float    "rate_weekly_high"
    t.float    "rate_monthly_regular"
    t.float    "rate_monthly_high"
    t.boolean  "published"
    t.date     "expires"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "property_pics", force: true do |t|
    t.integer  "property_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "property_pics", ["property_id"], name: "index_property_pics_on_property_id"

  create_table "property_reviews", force: true do |t|
    t.integer  "user_id"
    t.integer  "property_id"
    t.integer  "rating"
    t.text     "body"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.text     "addtl_emails"
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "country"
    t.string   "state"
    t.string   "city"
    t.string   "zip"
    t.text     "address"
    t.string   "phone_day"
    t.string   "phone_eve"
    t.string   "phone_cell"
    t.string   "currency"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.boolean  "admin",              default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
