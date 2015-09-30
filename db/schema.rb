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

ActiveRecord::Schema.define(version: 20150919124148) do

  create_table "activities", force: :cascade do |t|
    t.integer  "trackable_id",   limit: 4
    t.string   "trackable_type", limit: 255
    t.integer  "owner_id",       limit: 4
    t.string   "owner_type",     limit: 255
    t.string   "key",            limit: 255
    t.text     "parameters",     limit: 65535
    t.integer  "recipient_id",   limit: 4
    t.string   "recipient_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type", using: :btree
  add_index "activities", ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type", using: :btree
  add_index "activities", ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type", using: :btree

  create_table "course_subjects", force: :cascade do |t|
    t.integer  "status",     limit: 4, default: 0
    t.integer  "position",   limit: 4
    t.integer  "subject_id", limit: 4
    t.integer  "course_id",  limit: 4
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "course_subjects", ["course_id"], name: "index_course_subjects_on_course_id", using: :btree
  add_index "course_subjects", ["subject_id"], name: "index_course_subjects_on_subject_id", using: :btree

  create_table "courses", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.integer  "status",      limit: 4,     default: 0
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.integer  "subject_id",  limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "tasks", ["subject_id"], name: "index_tasks_on_subject_id", using: :btree

  create_table "user_courses", force: :cascade do |t|
    t.boolean  "active",                  default: true
    t.integer  "user_id",       limit: 4
    t.integer  "supervisor_id", limit: 4
    t.integer  "leader_id",     limit: 4
    t.integer  "course_id",     limit: 4
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "user_subjects", force: :cascade do |t|
    t.boolean  "finish",                      default: false
    t.integer  "user_id",           limit: 4
    t.integer  "course_id",         limit: 4
    t.integer  "subject_id",        limit: 4
    t.integer  "user_course_id",    limit: 4
    t.integer  "course_subject_id", limit: 4
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  add_index "user_subjects", ["course_id"], name: "index_user_subjects_on_course_id", using: :btree
  add_index "user_subjects", ["course_subject_id"], name: "index_user_subjects_on_course_subject_id", using: :btree
  add_index "user_subjects", ["subject_id"], name: "index_user_subjects_on_subject_id", using: :btree
  add_index "user_subjects", ["user_course_id"], name: "index_user_subjects_on_user_course_id", using: :btree
  add_index "user_subjects", ["user_id"], name: "index_user_subjects_on_user_id", using: :btree

  create_table "user_tasks", force: :cascade do |t|
    t.integer  "task_id",         limit: 4
    t.integer  "user_subject_id", limit: 4
    t.integer  "user_id",         limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "user_tasks", ["task_id"], name: "index_user_tasks_on_task_id", using: :btree
  add_index "user_tasks", ["user_id"], name: "index_user_tasks_on_user_id", using: :btree
  add_index "user_tasks", ["user_subject_id"], name: "index_user_tasks_on_user_subject_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",                   limit: 255
    t.integer  "role",                   limit: 4,   default: 2
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "course_subjects", "courses"
  add_foreign_key "course_subjects", "subjects"
  add_foreign_key "tasks", "subjects"
  add_foreign_key "user_subjects", "course_subjects"
  add_foreign_key "user_subjects", "courses"
  add_foreign_key "user_subjects", "subjects"
  add_foreign_key "user_subjects", "user_courses"
  add_foreign_key "user_subjects", "users"
  add_foreign_key "user_tasks", "tasks"
  add_foreign_key "user_tasks", "user_subjects"
  add_foreign_key "user_tasks", "users"
end
