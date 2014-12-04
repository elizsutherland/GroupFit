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

ActiveRecord::Schema.define(version: 20141204150120) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "challenges", force: true do |t|
    t.text     "statement"
    t.integer  "group_id",                   null: false
    t.string   "title"
    t.date     "start_date"
    t.date     "end_date"
    t.boolean  "current",    default: false, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "group_memberships", force: true do |t|
    t.integer  "user_id",                    null: false
    t.integer  "group_id",                   null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "admin",      default: false, null: false
  end

  create_table "groups", force: true do |t|
    t.string   "title",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "first_name",      null: false
    t.string   "last_name",       null: false
    t.string   "city",            null: false
    t.string   "state",           null: false
    t.string   "image_url"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  create_table "workouts", force: true do |t|
    t.integer  "user_id",                   null: false
    t.integer  "challenge_id",              null: false
    t.string   "place",        default: "", null: false
    t.date     "date",                      null: false
    t.string   "activity",     default: "", null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

end
