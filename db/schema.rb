# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_11_115806) do

  create_table "book_checkout_histories", force: :cascade do |t|
    t.integer "book_id", null: false
    t.integer "checkout_user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_book_checkout_histories_on_book_id"
    t.index ["checkout_user_id"], name: "index_book_checkout_histories_on_checkout_user_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "author"
    t.string "publisher"
    t.date "published_at"
    t.string "description"
    t.string "isbn10"
    t.string "isbn13"
    t.integer "status", default: 0, null: false
    t.integer "library_id", null: false
    t.integer "checkout_user_id"
    t.integer "register_user_id"
    t.integer "update_user_id"
    t.integer "lock_version", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["checkout_user_id"], name: "index_books_on_checkout_user_id"
    t.index ["library_id"], name: "index_books_on_library_id"
    t.index ["register_user_id"], name: "index_books_on_register_user_id"
    t.index ["status"], name: "index_books_on_status"
    t.index ["update_user_id"], name: "index_books_on_update_user_id"
  end

  create_table "libraries", force: :cascade do |t|
    t.string "name", null: false
    t.integer "register_user_id"
    t.integer "lock_version", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["register_user_id"], name: "index_libraries_on_register_user_id"
  end

  create_table "library_users", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "library_id", null: false
    t.integer "role", default: 0
    t.integer "status", default: 0
    t.string "activation_code"
    t.datetime "activation_code_expired_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["library_id"], name: "index_library_users_on_library_id"
    t.index ["user_id"], name: "index_library_users_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "name", null: false
    t.string "password_digest"
    t.integer "register_user_id"
    t.integer "update_user_id"
    t.integer "lock_version", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["register_user_id"], name: "index_users_on_register_user_id"
    t.index ["update_user_id"], name: "index_users_on_update_user_id"
  end

  add_foreign_key "book_checkout_histories", "books"
  add_foreign_key "book_checkout_histories", "users", column: "checkout_user_id"
  add_foreign_key "books", "libraries"
  add_foreign_key "books", "users", column: "checkout_user_id"
  add_foreign_key "books", "users", column: "register_user_id"
  add_foreign_key "books", "users", column: "update_user_id"
  add_foreign_key "libraries", "users", column: "register_user_id"
  add_foreign_key "library_users", "libraries"
  add_foreign_key "library_users", "users"
  add_foreign_key "users", "users", column: "register_user_id"
  add_foreign_key "users", "users", column: "update_user_id"
end
