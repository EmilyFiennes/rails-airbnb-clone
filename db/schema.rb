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

ActiveRecord::Schema.define(version: 20161115142626) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "availabilities", force: :cascade do |t|
    t.datetime "start_on"
    t.datetime "end_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "item_id"
    t.index ["item_id"], name: "index_availabilities_on_item_id", using: :btree
  end

  create_table "items", force: :cascade do |t|
    t.string   "material_category"
    t.string   "brand_name"
    t.string   "model"
    t.integer  "model_year"
    t.integer  "length"
    t.string   "segment"
    t.string   "skill_level"
    t.float    "price"
    t.string   "ski_station"
    t.integer  "user_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["user_id"], name: "index_items_on_user_id", using: :btree
  end

  create_table "reservations", force: :cascade do |t|
    t.datetime "start_on"
    t.datetime "end_on"
    t.datetime "validated_on"
    t.datetime "cancelled_on"
    t.datetime "declined_on"
    t.string   "user_review"
    t.integer  "user_rating"
    t.string   "owner_review"
    t.integer  "owner_rating"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "item_id"
    t.integer  "user_id"
    t.index ["item_id"], name: "index_reservations_on_item_id", using: :btree
    t.index ["user_id"], name: "index_reservations_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "provider"
    t.string   "uid"
    t.string   "facebook_picture_url"
    t.string   "token"
    t.datetime "token_expiry"
    t.string   "bio"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "availabilities", "items"
  add_foreign_key "items", "users"
  add_foreign_key "reservations", "items"
  add_foreign_key "reservations", "users"
end
