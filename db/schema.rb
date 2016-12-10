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

ActiveRecord::Schema.define(version: 20161210194514) do

  create_table "addresses", force: :cascade do |t|
    t.string   "city"
    t.string   "country"
    t.string   "state"
    t.string   "line1"
    t.string   "line2"
    t.integer  "postal_code"
    t.integer  "stripe_account_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["stripe_account_id"], name: "index_addresses_on_stripe_account_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "science"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories_projects", force: :cascade do |t|
    t.integer "project_id"
    t.integer "category_id"
    t.index ["category_id"], name: "index_categories_projects_on_category_id"
    t.index ["project_id"], name: "index_categories_projects_on_project_id"
  end

  create_table "contents", force: :cascade do |t|
    t.integer  "project_id"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "kind"
    t.index ["project_id"], name: "index_contents_on_project_id"
  end

  create_table "images", force: :cascade do |t|
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "pic_file_name"
    t.string   "pic_content_type"
    t.integer  "pic_file_size"
    t.datetime "pic_updated_at"
    t.integer  "project_id"
    t.index ["project_id"], name: "index_images_on_project_id"
  end

  create_table "logs", force: :cascade do |t|
    t.string   "title"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "body"
    t.integer  "user_id"
    t.index ["project_id"], name: "index_logs_on_project_id"
    t.index ["user_id"], name: "index_logs_on_user_id"
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "posted"
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "stripe_accounts", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "last_4_social"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "managed_id"
    t.date     "date_of_birth"
    t.index ["user_id"], name: "index_stripe_accounts_on_user_id"
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

  create_table "videos", force: :cascade do |t|
    t.string   "youtube_link"
    t.integer  "project_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["project_id"], name: "index_videos_on_project_id"
  end

end
