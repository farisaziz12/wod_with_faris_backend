# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_10_18_184957) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string "name"
    t.date "date"
    t.string "activity_type"
    t.string "workout"
    t.integer "duration"
    t.integer "calories_burned"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_activities_on_user_id"
  end

  create_table "athlete_teams", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "team_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["team_id"], name: "index_athlete_teams_on_team_id"
    t.index ["user_id"], name: "index_athlete_teams_on_user_id"
  end

  create_table "ptsessions", force: :cascade do |t|
    t.string "name"
    t.date "date"
    t.string "time"
    t.string "description"
    t.boolean "paid"
    t.string "location"
    t.integer "price"
    t.boolean "pt_session", default: true
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_ptsessions_on_user_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.date "date"
    t.string "time"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "workout"
    t.integer "class_capacity"
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_pt_sessions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "ptsession_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ptsession_id"], name: "index_user_pt_sessions_on_ptsession_id"
    t.index ["user_id"], name: "index_user_pt_sessions_on_user_id"
  end

  create_table "user_sessions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "session_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["session_id"], name: "index_user_sessions_on_session_id"
    t.index ["user_id"], name: "index_user_sessions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.integer "tokens"
    t.boolean "coach"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image"
    t.bigint "team_id"
    t.index ["team_id"], name: "index_users_on_team_id"
  end

  add_foreign_key "activities", "users"
  add_foreign_key "athlete_teams", "teams"
  add_foreign_key "athlete_teams", "users"
  add_foreign_key "ptsessions", "users"
  add_foreign_key "sessions", "users"
  add_foreign_key "user_pt_sessions", "ptsessions"
  add_foreign_key "user_pt_sessions", "users"
  add_foreign_key "user_sessions", "sessions"
  add_foreign_key "user_sessions", "users"
  add_foreign_key "users", "teams"
end
