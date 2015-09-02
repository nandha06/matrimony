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

ActiveRecord::Schema.define(version: 20150902065717) do

  create_table "addresses", force: :cascade do |t|
    t.integer  "user_id",         limit: 4
    t.integer  "country_id",      limit: 4
    t.integer  "state_id",        limit: 4
    t.integer  "city_id",         limit: 4
    t.integer  "residenttype_id", limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "annual_incomes", force: :cascade do |t|
    t.string   "income_type", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "castes", force: :cascade do |t|
    t.string   "caste_name", limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string   "city_name",  limit: 255
    t.integer  "state_id",   limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string   "country_name", limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "educategories", force: :cascade do |t|
    t.string   "category_name", limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "education_fields", force: :cascade do |t|
    t.string   "field_name", limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "education_levels", force: :cascade do |t|
    t.string   "level_name", limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "educations", force: :cascade do |t|
    t.string   "course_name", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "gothrams", force: :cascade do |t|
    t.string   "gothram_name", limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "horoscopes", force: :cascade do |t|
    t.integer  "user_id",        limit: 4
    t.string   "horoscope_name", limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "languages", force: :cascade do |t|
    t.string   "lang_name",  limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "marital_statuses", force: :cascade do |t|
    t.string   "marital_status", limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "nakshatras", force: :cascade do |t|
    t.string   "nakshatra_name", limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "occupations", force: :cascade do |t|
    t.string   "occ_name",   limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "physicaldetails", force: :cascade do |t|
    t.integer  "user_id",          limit: 4
    t.decimal  "height",                       precision: 10
    t.decimal  "weight",                       precision: 10
    t.string   "skin_tone",        limit: 255
    t.string   "hair_color",       limit: 255
    t.string   "eye_color",        limit: 255
    t.string   "physical_status",  limit: 255
    t.string   "body_type",        limit: 255
    t.string   "health_condition", limit: 255
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  create_table "profile_types", force: :cascade do |t|
    t.string   "type_name",  limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "rasis", force: :cascade do |t|
    t.integer  "nakshatra_id", limit: 4
    t.string   "rasi_name",    limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "religions", force: :cascade do |t|
    t.string   "rel_name",   limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "residenttypes", force: :cascade do |t|
    t.string   "type_name",  limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "states", force: :cascade do |t|
    t.string   "state_name", limit: 255
    t.integer  "country_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "user_families", force: :cascade do |t|
    t.integer  "father_status_id", limit: 4
    t.integer  "mother_status_id", limit: 4
    t.integer  "no_of_brother",    limit: 4
    t.integer  "no_of_sister",     limit: 4
    t.integer  "value",            limit: 4
    t.integer  "affuluence_level", limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "user_habits", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "diet",       limit: 4
    t.integer  "drinking",   limit: 4
    t.integer  "smoking",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "user_hobbies", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.string   "hobby_name", limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "user_languages", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.integer  "language_id", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "user_qualifications", force: :cascade do |t|
    t.integer  "user_id",            limit: 4
    t.integer  "education_level_id", limit: 4
    t.integer  "education_field_id", limit: 4
    t.integer  "education_id",       limit: 4
    t.string   "working_with",       limit: 255
    t.integer  "occupation_id",      limit: 4
    t.integer  "annual_income_id",   limit: 4
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "userastros", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.integer  "rasi_id",      limit: 4
    t.integer  "nakshatra_id", limit: 4
    t.integer  "gothram_id",   limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
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
    t.string   "user_name",              limit: 255
    t.integer  "profile_type_id",        limit: 4
    t.string   "date_of_birth",          limit: 255
    t.string   "gender",                 limit: 255
    t.integer  "age",                    limit: 4
    t.integer  "religion_id",            limit: 4
    t.integer  "caste_id",               limit: 4
    t.integer  "mother_tongue_id",       limit: 4
    t.string   "phone_no",               limit: 255
    t.string   "marital_status_id",      limit: 255
    t.string   "description",            limit: 255
    t.string   "disability",             limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
