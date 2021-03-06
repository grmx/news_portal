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

ActiveRecord::Schema.define(version: 20141128115915) do

  create_table "news", force: true do |t|
    t.text     "title",      limit: 510
    t.text     "body"
    t.integer  "source_id"
    t.datetime "date"
    t.string   "guid"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "content"
  end

  add_index "news", ["guid"], name: "index_news_on_guid"
  add_index "news", ["source_id"], name: "index_news_on_source_id"
  add_index "news", ["title"], name: "index_news_on_title"

  create_table "sources", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.string   "uri"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sources", ["title"], name: "index_sources_on_title"

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
