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

ActiveRecord::Schema.define(version: 2019_06_12_194629) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "product_id"
    t.date "fromdate"
    t.date "todate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "amount"
    t.index ["product_id"], name: "index_bookings_on_product_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "images", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.index ["product_id"], name: "index_images_on_product_id"
    t.index ["user_id"], name: "index_images_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.integer "price"
    t.integer "rating"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.bigint "user_id"
    t.string "photo"
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.string "content"
    t.bigint "user_id"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_reviews_on_product_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "encrypted_password", default: "", null: false
    t.string "name"
    t.string "photo"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "products"
  add_foreign_key "bookings", "users"
  add_foreign_key "images", "products"
  add_foreign_key "images", "users"
  add_foreign_key "products", "users"
  add_foreign_key "reviews", "products"
  add_foreign_key "reviews", "users"
end
