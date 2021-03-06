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

ActiveRecord::Schema.define(version: 2019_11_18_010344) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.string "vegetarian"
    t.string "calories"
    t.string "restaurant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "price"
    t.string "category"
  end

  create_table "locations", force: :cascade do |t|
    t.string "city"
    t.string "state"
    t.integer "user_id"
    t.integer "restaurant_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.string "price_range"
    t.string "parking"
    t.string "wifi"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "occasion"
    t.string "takeS_reservations"
    t.string "rating"
    t.text "comment"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "name"
    t.string "avatar_url"
    t.string "email"
    t.string "uid"
    t.string "provider"
    t.string "oauth_token"
    t.string "google_token"
    t.string "token"
    t.string "secret"
    t.string "profile_image"
    t.string "google_refresh_token"
  end

end
