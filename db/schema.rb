# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160520064347) do

  create_table "trucks", force: :cascade do |t|
    t.string   "from_loc",     limit: 255
    t.string   "from_country", limit: 3
    t.string   "to_loc",       limit: 255
    t.string   "to_country",   limit: 3
    t.integer  "distance",     limit: 4
    t.integer  "duration",     limit: 4
    t.integer  "user_id",      limit: 4
    t.string   "company_name", limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "company_name",    limit: 60
    t.string   "email",           limit: 255
    t.string   "phone",           limit: 50
    t.boolean  "isAdmin"
    t.boolean  "email_confirmed"
    t.string   "confirm_token",   limit: 255
    t.string   "password_digest", limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "users", ["email"], name: "email", unique: true, using: :btree

end
