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

ActiveRecord::Schema.define(version: 20170726125440) do

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

<<<<<<< HEAD
  create_table "brands", force: :cascade do |t|
    t.string "name"
=======
  create_table "meta_sources", force: :cascade do |t|
    t.string "type", limit: 255, null: false
    t.string "label", limit: 255, null: false
    t.string "value", limit: 255, null: false
>>>>>>> refs/remotes/origin/dev
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
    t.bigint "attachment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attachment_id"], name: "index_profiles_on_attachment_id"
    t.index ["user_id"], name: "index_profiles_on_user_id"
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

  create_table "vehicles", force: :cascade do |t|
    t.bigint "owner_id"
    t.string "type", limit: 255
    t.string "model", limit: 255
    t.string "license_plate", limit: 50
    t.integer "year"
    t.string "branch", limit: 50
    t.string "description", limit: 1000
    t.boolean "rent_publish"
    t.bigint "chassi_id"
    t.bigint "engine"
    t.string "horsepower", limit: 50
    t.integer "doors", limit: 2
    t.integer "seats", limit: 2
    t.bigint "transmission_id"
    t.bigint "fuel_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chassi_id"], name: "index_vehicles_on_chassi_id"
    t.index ["fuel_type_id"], name: "index_vehicles_on_fuel_type_id"
    t.index ["owner_id"], name: "index_vehicles_on_owner_id"
    t.index ["transmission_id"], name: "index_vehicles_on_transmission_id"
  end

  add_foreign_key "attachments", "users"
  add_foreign_key "profiles", "attachments"
  add_foreign_key "profiles", "users"
  add_foreign_key "vehicles", "meta_sources", column: "chassi_id"
  add_foreign_key "vehicles", "meta_sources", column: "fuel_type_id"
  add_foreign_key "vehicles", "meta_sources", column: "transmission_id"
  add_foreign_key "vehicles", "users", column: "owner_id"
end
