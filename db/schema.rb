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

ActiveRecord::Schema.define(version: 2018_09_28_000031) do

  create_table "bandwidth_packages", force: :cascade do |t|
    t.string "name"
    t.integer "network_id"
    t.string "group_policy_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["network_id"], name: "index_bandwidth_packages_on_network_id"
  end

  create_table "networks", force: :cascade do |t|
    t.string "name"
    t.string "api_key"
    t.string "network_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "switch_ports", force: :cascade do |t|
    t.integer "number"
    t.boolean "is_managed"
    t.integer "unit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "switch_id"
    t.index ["switch_id"], name: "index_switch_ports_on_switch_id"
    t.index ["unit_id"], name: "index_switch_ports_on_unit_id"
  end

  create_table "switches", force: :cascade do |t|
    t.string "serial"
    t.integer "network_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["network_id"], name: "index_switches_on_network_id"
  end

  create_table "units", force: :cascade do |t|
    t.string "name"
    t.integer "bandwidth_package_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "mac_address"
    t.string "error"
    t.index ["bandwidth_package_id"], name: "index_units_on_bandwidth_package_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
