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

ActiveRecord::Schema[7.0].define(version: 2024_03_28_230710) do
  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "logo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "role"
    t.integer "company_id", null: false
    t.integer "manager_id"
    t.string "phone_number"
    t.boolean "has_sms"
    t.string "profile_picture"
    t.string "time_zone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["company_id"], name: "index_employees_on_company_id"
    t.index ["email"], name: "index_employees_on_email", unique: true
    t.index ["manager_id"], name: "index_employees_on_manager_id"
    t.index ["reset_password_token"], name: "index_employees_on_reset_password_token", unique: true
  end

  create_table "messages", force: :cascade do |t|
    t.integer "sender_id", null: false
    t.string "message"
    t.string "status"
    t.integer "time_entry_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sender_id"], name: "index_messages_on_sender_id"
    t.index ["time_entry_id"], name: "index_messages_on_time_entry_id"
  end

  create_table "timesheet_entries", force: :cascade do |t|
    t.integer "employee_id", null: false
    t.datetime "started_at"
    t.datetime "ended_at"
    t.decimal "hours_worked"
    t.text "comments"
    t.string "entry_approval_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_timesheet_entries_on_employee_id"
  end

  add_foreign_key "employees", "companies"
end