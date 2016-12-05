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

ActiveRecord::Schema.define(version: 20161205000017) do

  create_table "logs", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["project_id"], name: "index_logs_on_project_id"
  end

  create_table "payments", force: :cascade do |t|
    t.integer  "amount"
    t.integer  "user_id"
    t.integer  "pool_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pool_id"], name: "index_payments_on_pool_id"
    t.index ["user_id"], name: "index_payments_on_user_id"
  end

  create_table "pools", force: :cascade do |t|
    t.integer  "goal"
    t.integer  "pledged"
    t.datetime "deadline"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "about"
    t.text     "context"
    t.text     "significance"
    t.text     "goals"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.boolean  "posted"
    t.string   "video"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
