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

ActiveRecord::Schema.define(version: 20150125001615) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: true do |t|
    t.string   "repo"
    t.text     "message"
    t.datetime "date"
    t.integer  "student_id"
  end

  add_index "events", ["student_id"], name: "index_events_on_student_id", using: :btree

  create_table "languages", force: true do |t|
    t.string  "lang_name"
    t.integer "lang_amount"
    t.integer "repo_id"
  end

  add_index "languages", ["lang_name", "repo_id"], name: "index_languages_on_lang_name_and_repo_id", unique: true, using: :btree
  add_index "languages", ["repo_id"], name: "index_languages_on_repo_id", using: :btree

  create_table "repos", id: false, force: true do |t|
    t.integer  "id",               null: false
    t.string   "name"
    t.integer  "stargazers_count"
    t.integer  "watchers_count"
    t.text     "description"
    t.string   "html_url"
    t.integer  "student_id"
    t.datetime "updated"
    t.string   "homepage"
  end

  add_index "repos", ["id"], name: "index_repos_on_id", unique: true, using: :btree
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
    t.integer  "cohort"
  end

  add_index "students", ["username"], name: "index_students_on_username", unique: true, using: :btree

end
