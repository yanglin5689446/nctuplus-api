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

ActiveRecord::Schema.define(version: 20180729151302) do
  create_table "books", force: :cascade do |t|
    t.string   "name"
    t.string   "isbn"
    t.string   "authors"
    t.string   "info"
    t.string   "cover_image"
    t.string   "preview_url"
    t.integer  "user_id"
    t.integer  "price",       default: 0, null: false
    t.integer  "status",      default: 0, null: false
    t.integer  "view_count",  default: 0, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["user_id"], name: "index_books_on_user_id"
  end

  create_table "bulletins", force: :cascade do |t|
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "title", default: "untitled", null: false
    t.string   "content"
    t.integer  "category"
    t.datetime "begin_time"
    t.datetime "end_time"
    t.integer  "author_id"
    t.index ["author_id"], name: "index_bulletins_on_author_id"
  end

  create_table "colleges", force: :cascade do |t|
    t.string   "name"
    t.string   "code", limit: 1, null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "departments", force: :cascade do |t|
    t.string   "name"
    t.integer  "category", default: 0, null: false
    t.string   "department_type", limit: 1
    t.string   "code",            limit: 2
    t.integer  "college_id"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.index ["college_id"], name: "index_departments_on_college_id"
  end

  create_table "events", force: :cascade do |t|
    t.integer  "event_type"
    t.string   "title", default: "untitled", null: false
    t.string   "organization"
    t.string   "location"
    t.string   "url"
    t.string   "content"
    t.datetime "begin_time"
    t.datetime "end_time"
    t.integer  "user_id"
    t.integer  "view_count", default: 0
    t.string   "cover_image"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider",                    default: "email", null: false
    t.string   "uid",                         default: "",      null: false
    t.string   "encrypted_password",          default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean  "allow_password_change",       default: false
    t.integer  "sign_in_count",               default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "name"
    t.string   "email"
    t.integer  "role",                        default: 0
    t.boolean  "agree_to_term_of_service",    default: false,   null: false
    t.boolean  "agree_to_share_course_table", default: false,   null: false
    t.integer  "admission_year"
    t.text     "tokens"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  create_table "users_events", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.integer  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_users_events_on_event_id"
    t.index ["user_id"], name: "index_users_events_on_user_id"
  end
end
