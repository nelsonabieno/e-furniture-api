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

ActiveRecord::Schema.define(version: 20181209211014) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "street_address"
    t.string "lga"
    t.string "city"
    t.string "state"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "carts", force: :cascade do |t|
    t.integer "transaction_id"
    t.integer "qty"
    t.string "price"
    t.string "total_amount"
    t.string "string"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
  end

  create_table "order_statuses", force: :cascade do |t|
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "transaction_id"
    t.integer "order_no"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payments", force: :cascade do |t|
    t.integer "transaction_id"
    t.string "amount"
    t.string "pay_method"
    t.string "payment_status"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_payments_on_user_id"
  end

  create_table "product_categories", force: :cascade do |t|
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "color"
    t.string "material"
    t.string "image_front"
    t.string "image_back"
    t.string "image_left"
    t.string "image_right"
    t.string "price"
    t.string "brand"
    t.string "size"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
  end

  create_table "shipping_details", force: :cascade do |t|
    t.string "recipient_name"
    t.string "recipient_address"
    t.string "order_no"
    t.integer "lg_id"
    t.integer "state_id"
    t.string "phone_no"
    t.string "city"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_shipping_details_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone_no"
    t.string "email"
    t.string "profile_img"
    t.string "password_digest"
    t.boolean "login_status"
    t.bigint "role_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["phone_no"], name: "index_users_on_phone_no", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "payments", "users"
  add_foreign_key "products", "users"
  add_foreign_key "shipping_details", "users"
  add_foreign_key "users", "roles"
end
