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

ActiveRecord::Schema.define(version: 20151130100255) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "drill_id"
    t.integer  "user_id"
    t.integer  "type_of"
  end

  add_index "answers", ["drill_id"], name: "index_answers_on_drill_id", using: :btree
  add_index "answers", ["user_id"], name: "index_answers_on_user_id", using: :btree

  create_table "badges", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
    t.string   "image"
  end

  create_table "badgings", force: :cascade do |t|
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "drill_group_id"
    t.integer  "badge_id"
  end

  add_index "badgings", ["badge_id"], name: "index_badgings_on_badge_id", using: :btree
  add_index "badgings", ["drill_group_id"], name: "index_badgings_on_drill_group_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categorizations", force: :cascade do |t|
    t.integer  "drill_group_id"
    t.integer  "category_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "categorizations", ["category_id"], name: "index_categorizations_on_category_id", using: :btree
  add_index "categorizations", ["drill_group_id"], name: "index_categorizations_on_drill_group_id", using: :btree

  create_table "drill_completes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "drill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "drill_completes", ["drill_id"], name: "index_drill_completes_on_drill_id", using: :btree
  add_index "drill_completes", ["user_id"], name: "index_drill_completes_on_user_id", using: :btree

  create_table "drill_groups", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "level"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

  add_index "drill_groups", ["user_id"], name: "index_drill_groups_on_user_id", using: :btree

  create_table "drills", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "points"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "drill_group_id"
    t.integer  "user_id"
    t.integer  "answer_id"
  end

  add_index "drills", ["answer_id"], name: "index_drills_on_answer_id", using: :btree
  add_index "drills", ["drill_group_id"], name: "index_drills_on_drill_group_id", using: :btree
  add_index "drills", ["user_id"], name: "index_drills_on_user_id", using: :btree

  create_table "user_badges", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "badge_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_badges", ["badge_id"], name: "index_user_badges_on_badge_id", using: :btree
  add_index "user_badges", ["user_id"], name: "index_user_badges_on_user_id", using: :btree

  create_table "user_drill_groups", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "drill_group_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "user_drill_groups", ["drill_group_id"], name: "index_user_drill_groups_on_drill_group_id", using: :btree
  add_index "user_drill_groups", ["user_id"], name: "index_user_drill_groups_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.boolean  "admin",                  default: false
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "points"
    t.string   "profile_pic"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "answers", "drills"
  add_foreign_key "answers", "users"
  add_foreign_key "badgings", "badges"
  add_foreign_key "badgings", "drill_groups"
  add_foreign_key "categorizations", "categories"
  add_foreign_key "categorizations", "drill_groups"
  add_foreign_key "drill_completes", "drills"
  add_foreign_key "drill_completes", "users"
  add_foreign_key "drill_groups", "users"
  add_foreign_key "drills", "answers"
  add_foreign_key "drills", "drill_groups"
  add_foreign_key "drills", "users"
  add_foreign_key "user_badges", "badges"
  add_foreign_key "user_badges", "users"
  add_foreign_key "user_drill_groups", "drill_groups"
  add_foreign_key "user_drill_groups", "users"
end
