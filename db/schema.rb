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

ActiveRecord::Schema.define(version: 20170205235214) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "deeds", force: :cascade do |t|
    t.string   "desc"
    t.datetime "started_at"
    t.datetime "finished_at"
    t.integer  "points"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "hustle_id"
    t.integer  "state",          default: 3
    t.datetime "thought_at"
    t.float    "total_elapsed",  default: 0.0
    t.datetime "eph_started_at"
    t.integer  "roll_id"
    t.index ["hustle_id"], name: "index_deeds_on_hustle_id", using: :btree
    t.index ["roll_id"], name: "index_deeds_on_roll_id", using: :btree
  end

  create_table "hustles", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created"
    t.datetime "modified"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_hustles_on_user_id", using: :btree
  end

  create_table "rolls", force: :cascade do |t|
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "user_id"
    t.string   "name"
    t.datetime "deadline"
    t.boolean  "finished",   default: false
    t.index ["user_id"], name: "index_rolls_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "deeds", "hustles"
  add_foreign_key "deeds", "rolls"
  add_foreign_key "hustles", "users"
  add_foreign_key "rolls", "users"
end
