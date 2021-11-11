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

ActiveRecord::Schema.define(version: 2021_11_11_101724) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "item_stocks", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.integer "quantity", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_item_stocks_on_product_id"
  end

  create_table "money_stocks", force: :cascade do |t|
    t.integer "deposit", null: false
    t.integer "deposit_10", null: false
    t.integer "deposit_50", null: false
    t.integer "deposit_100", null: false
    t.integer "deposit_500", null: false
    t.integer "deposit_1000", null: false
    t.integer "stock_10", null: false
    t.integer "stock_50", null: false
    t.integer "stock_100", null: false
    t.integer "stock_500", null: false
    t.integer "stock_1000", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.bigint "temperature_id", null: false
    t.integer "price"
    t.bigint "vendor_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["temperature_id"], name: "index_products_on_temperature_id"
    t.index ["vendor_id"], name: "index_products_on_vendor_id"
  end

  create_table "sales_histories", force: :cascade do |t|
    t.datetime "purchase_time", null: false
    t.bigint "product_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_sales_histories_on_product_id"
  end

  create_table "temperatures", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "vendors", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "item_stocks", "products"
  add_foreign_key "products", "temperatures"
  add_foreign_key "products", "vendors"
  add_foreign_key "sales_histories", "products"
end
