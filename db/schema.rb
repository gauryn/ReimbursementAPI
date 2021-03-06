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

ActiveRecord::Schema.define(version: 20161210150617) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.date     "event_date"
    t.string   "name"
    t.string   "location"
    t.integer  "num_of_attendees"
    t.integer  "organization_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "organizations", force: :cascade do |t|
    t.string   "name"
    t.boolean  "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reimbursements", force: :cascade do |t|
    t.decimal  "total"
    t.string   "description"
    t.date     "request_date"
    t.integer  "requester_id"
    t.date     "event_date"
    t.string   "event_name"
    t.string   "event_location"
    t.integer  "num_of_attendees"
    t.string   "organization"
    t.text     "receipt_images"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.date     "approval_date"
  end

  create_table "user_orgs", force: :cascade do |t|
    t.string   "role"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "organization"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "andrewid"
    t.string   "email"
    t.integer  "smc"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
