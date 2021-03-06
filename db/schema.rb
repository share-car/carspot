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

ActiveRecord::Schema.define(version: 20170728080634) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachments", force: :cascade do |t|
    t.string "type", limit: 255, null: false
    t.string "name", limit: 255, null: false
    t.string "description", limit: 1000
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_attachments_on_name"
    t.index ["user_id"], name: "index_attachments_on_user_id"
  end

  create_table "cars", force: :cascade do |t|
    t.string "engine", limit: 50
    t.string "horsepower", limit: 50
    t.string "torque", limit: 50
    t.integer "doors", limit: 2
    t.integer "seats", limit: 2
    t.bigint "chassi_id"
    t.bigint "transmission_id"
    t.bigint "fuel_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chassi_id"], name: "index_cars_on_chassi_id"
    t.index ["fuel_type_id"], name: "index_cars_on_fuel_type_id"
    t.index ["transmission_id"], name: "index_cars_on_transmission_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "body", null: false
    t.bigint "user_id"
    t.string "commentable_type"
    t.bigint "commentable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "custom_prices", force: :cascade do |t|
    t.date "from_date", null: false
    t.date "to_date", null: false
    t.integer "price", default: 0, null: false
    t.bigint "rent_setting_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rent_setting_id"], name: "index_custom_prices_on_rent_setting_id"
  end

  create_table "meta_sources", force: :cascade do |t|
    t.string "type", limit: 255, null: false
    t.string "label", limit: 255, null: false
    t.string "value", limit: 255, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.string "first_name", limit: 255, null: false
    t.string "last_name", limit: 255, null: false
    t.string "address", limit: 1000
    t.string "phone", limit: 12
    t.string "identity_card", limit: 255
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "rent_requests", force: :cascade do |t|
    t.bigint "vehicle_info_id"
    t.bigint "user_id"
    t.bigint "status_id"
    t.date "from_date", null: false
    t.date "to_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["status_id"], name: "index_rent_requests_on_status_id"
    t.index ["user_id"], name: "index_rent_requests_on_user_id"
    t.index ["vehicle_info_id"], name: "index_rent_requests_on_vehicle_info_id"
  end

  create_table "rent_settings", force: :cascade do |t|
    t.integer "base_price", default: 0, null: false
    t.integer "driver_price"
    t.text "description"
    t.string "rentable_type"
    t.bigint "rentable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rentable_type", "rentable_id"], name: "index_rent_settings_on_rentable_type_and_rentable_id"
  end

  create_table "service_options", force: :cascade do |t|
    t.string "label", limit: 255, null: false
    t.integer "price", default: 0, null: false
    t.string "desciption", limit: 1000
    t.bigint "rent_setting_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rent_setting_id"], name: "index_service_options_on_rent_setting_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.string "nickname"
    t.string "image"
    t.string "email"
    t.json "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  create_table "vehicle_infos", force: :cascade do |t|
    t.bigint "user_id"
    t.string "model", limit: 255, null: false
    t.string "license_plate", limit: 50, null: false
    t.integer "year", null: false
    t.string "branch", limit: 50, null: false
    t.text "description"
    t.boolean "rent_publish"
    t.string "vehicle_type"
    t.bigint "vehicle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_vehicle_infos_on_user_id"
    t.index ["vehicle_type", "vehicle_id"], name: "index_vehicle_infos_on_vehicle_type_and_vehicle_id"
  end

  add_foreign_key "attachments", "users"
  add_foreign_key "cars", "meta_sources", column: "chassi_id"
  add_foreign_key "cars", "meta_sources", column: "fuel_type_id"
  add_foreign_key "cars", "meta_sources", column: "transmission_id"
  add_foreign_key "comments", "users"
  add_foreign_key "custom_prices", "rent_settings"
  add_foreign_key "profiles", "users"
  add_foreign_key "rent_requests", "meta_sources", column: "status_id"
  add_foreign_key "rent_requests", "users"
  add_foreign_key "rent_requests", "vehicle_infos"
  add_foreign_key "service_options", "rent_settings"
  add_foreign_key "vehicle_infos", "users"
end
