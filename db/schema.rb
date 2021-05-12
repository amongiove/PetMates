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

ActiveRecord::Schema.define(version: 2021_05_12_224648) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.integer "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "jobs", force: :cascade do |t|
    t.integer "sitter_id", null: false
    t.integer "owner_id", null: false
    t.text "specifics"
    t.string "acceptance_status"
    t.boolean "completion_status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "date_time"
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

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "jobs", "users", column: "owner_id"
  add_foreign_key "jobs", "users", column: "sitter_id"
  add_foreign_key "messages", "jobs"
  add_foreign_key "messages", "users"
  add_foreign_key "pets", "users", column: "owner_id"
  add_foreign_key "reviews", "users", column: "owner_id"
  add_foreign_key "reviews", "users", column: "sitter_id"
end
