# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_04_28_180844) do

  create_table "jobs", force: :cascade do |t|
    t.integer "sitter_id", null: false
    t.integer "owner_id", null: false
    t.date "date"
    t.time "time"
    t.text "specifics"
    t.string "acceptance_status"
    t.boolean "completion_status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["owner_id"], name: "index_jobs_on_owner_id"
    t.index ["sitter_id"], name: "index_jobs_on_sitter_id"
  end

  create_table "messages", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "job_id", null: false
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["job_id"], name: "index_messages_on_job_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "pets", force: :cascade do |t|
    t.integer "owner_id", null: false
    t.string "name"
    t.string "pet_type"
    t.string "breed"
    t.string "color"
    t.string "sex"
    t.integer "age"
    t.text "care_instructions"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["owner_id"], name: "index_pets_on_owner_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "sitter_id", null: false
    t.integer "owner_id", null: false
    t.text "review"
    t.integer "rating"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["owner_id"], name: "index_reviews_on_owner_id"
    t.index ["sitter_id"], name: "index_reviews_on_sitter_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "name"
    t.string "type"
    t.string "street_address"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "phone_number"
    t.text "home_access_info"
    t.text "bio"
    t.string "rate"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "jobs", "owners"
  add_foreign_key "jobs", "sitters"
  add_foreign_key "messages", "jobs"
  add_foreign_key "messages", "users"
  add_foreign_key "pets", "owners"
  add_foreign_key "reviews", "owners"
  add_foreign_key "reviews", "sitters"
end
