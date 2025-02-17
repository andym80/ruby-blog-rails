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

ActiveRecord::Schema[7.0].define(version: 2022_12_08_230840) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.text "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "users_id", null: false
    t.bigint "posts_id", null: false
    t.index ["posts_id"], name: "index_comments_on_posts_id"
    t.index ["users_id"], name: "index_comments_on_users_id"
  end

  create_table "likes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "posts_id"
    t.bigint "users_id"
    t.index ["posts_id", "users_id"], name: "index_likes_on_posts_id_and_users_id", unique: true
    t.index ["posts_id"], name: "index_likes_on_posts_id"
    t.index ["users_id", "posts_id"], name: "index_likes_on_users_id_and_posts_id", unique: true
    t.index ["users_id"], name: "index_likes_on_users_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "text"
    t.integer "comments_counter", default: 0
    t.integer "likes_counter", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "users_id", null: false
    t.index ["users_id"], name: "index_posts_on_users_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "photo", default: "https://randomuser.me/api/portraits/lego/6.jpg"
    t.text "bio"
    t.integer "posts_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", null: false
    t.string "encrypted_password", null: false
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
    t.string "role", default: "collaborator", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comments", "posts", column: "posts_id", on_delete: :cascade
  add_foreign_key "comments", "users", column: "users_id", on_delete: :nullify
  add_foreign_key "likes", "posts", column: "posts_id", on_delete: :cascade
  add_foreign_key "likes", "users", column: "users_id", on_delete: :cascade
  add_foreign_key "posts", "users", column: "users_id", on_delete: :nullify
end
