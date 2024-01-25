# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_01_25_012807) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "beers", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tilt_data", force: :cascade do |t|
    t.bigint "beer_id", null: false
    t.string "color"
    t.integer "temp_fahrenheit"
    t.integer "temp_celsius"
    t.float "gravity"
    t.datetime "timestamp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["beer_id"], name: "index_tilt_data_on_beer_id"
    t.index ["timestamp"], name: "index_tilt_data_on_timestamp"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "crypted_password"
    t.string "password_salt"
    t.string "persistence_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["persistence_token"], name: "index_users_on_persistence_token", unique: true
  end

  add_foreign_key "tilt_data", "beers"
end
