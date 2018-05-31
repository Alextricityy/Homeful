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


ActiveRecord::Schema.define(version: 2018_05_30_141548) do


  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contributions", force: :cascade do |t|
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "item_id"
    t.string "item_sku"
    t.integer "amount_cents", default: 0, null: false
    t.jsonb "payment"
    t.index ["item_id"], name: "index_contributions_on_item_id"
    t.index ["user_id"], name: "index_contributions_on_user_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "category"
    t.boolean "purchased", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "recipient_id"
    t.integer "price_cents", default: 0, null: false
    t.integer "total_contributions", default: 0
    t.index ["recipient_id"], name: "index_items_on_recipient_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "recipient_id"
    t.boolean "primary"
    t.index ["recipient_id"], name: "index_locations_on_recipient_id"
  end

  create_table "payments", force: :cascade do |t|
    t.integer "amount"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "location_id"
    t.index ["location_id"], name: "index_payments_on_location_id"
  end

  create_table "recipients", force: :cascade do |t|
    t.bigint "user_id"
    t.string "first_name"
    t.string "last_name"
    t.string "gender"
    t.string "dob"
    t.text "bio"
    t.string "phone_number"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id_id"
    t.index ["user_id_id"], name: "index_recipients_on_user_id_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.date "dob"
    t.boolean "volunteer", default: false
    t.text "bio"
    t.string "gender"
    t.string "postcode"
    t.float "latitude"
    t.float "longitude"
    t.string "photo"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "recipients", "users"
end
