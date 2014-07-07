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

ActiveRecord::Schema.define(version: 20140706182632) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: true do |t|
    t.string  "repo"
    t.text    "message"
    t.string  "date"
    t.integer "student_id"
  end

  add_index "events", ["student_id"], name: "index_events_on_student_id", using: :btree

  create_table "repos", force: true do |t|
    t.string   "name"
    t.json     "languages"
    t.integer  "stargazers_count"
    t.integer  "watchers_count"
    t.text     "description"
    t.string   "html_url"
    t.integer  "student_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "repos", ["student_id"], name: "index_repos_on_student_id", using: :btree

  create_table "students", force: true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "username",                  null: false
    t.string   "city"
    t.string   "session"
    t.string   "avatar_url"
    t.string   "url"
    t.boolean  "hireable"
    t.string   "company",      default: ""
    t.integer  "followers"
    t.integer  "following"
    t.integer  "public_repos"
    t.string   "blog"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "students", ["username"], name: "index_students_on_username", unique: true, using: :btree

end
