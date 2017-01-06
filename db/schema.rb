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

ActiveRecord::Schema.define(version: 20170106034803) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "distribution_centers", force: :cascade do |t|
    t.string   "name"
    t.integer  "city_id"
    t.integer  "capacity"
    t.integer  "persona_id"
    t.integer  "date_created"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "factories", force: :cascade do |t|
    t.string   "name"
    t.float    "production_rating"
    t.float    "quality_rating"
    t.float    "cost_rating"
    t.boolean  "availability"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "factory_id"
    t.integer  "order_date"
    t.integer  "quantity"
    t.boolean  "complete"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "personas", force: :cascade do |t|
    t.string   "name"
    t.integer  "money"
    t.integer  "user_id"
    t.integer  "level"
    t.integer  "current_date"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "product_distribution_centers", force: :cascade do |t|
    t.integer  "distribution_center_id"
    t.integer  "product_id"
    t.integer  "quantity"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.string   "category"
    t.integer  "persona_id"
    t.integer  "sell_price"
    t.text     "picture"
    t.boolean  "active"
    t.integer  "date_created"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "demand"
  end

  create_table "users", force: :cascade do |t|
    t.string   "user_name"
    t.string   "password_digest"
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
