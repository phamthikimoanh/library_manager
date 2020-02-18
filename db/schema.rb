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

ActiveRecord::Schema.define(version: 2020_02_18_083203) do

  create_table "admins", force: :cascade do |t|
    t.string "name"
    t.date "birthday"
    t.string "phone"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "book_cards", force: :cascade do |t|
    t.string "name"
    t.date "return_date"
    t.integer "price_borrow"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "book_id"
    t.integer "book_order_id"
    t.index ["book_id"], name: "index_book_cards_on_book_id"
    t.index ["book_order_id"], name: "index_book_cards_on_book_order_id"
  end

  create_table "book_orders", force: :cascade do |t|
    t.integer "amount_book"
    t.date "brorrow_date"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "deposits"
    t.index ["user_id"], name: "index_book_orders_on_user_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "isbn"
    t.string "name"
    t.string "desc"
    t.string "author"
    t.string "image"
    t.integer "books_total"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "category_id"
    t.integer "price"
    t.integer "book_stock"
    t.index ["category_id"], name: "index_books_on_category_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.date "birthday"
    t.string "phone"
    t.string "address"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
