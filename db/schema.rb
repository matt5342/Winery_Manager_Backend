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

ActiveRecord::Schema.define(version: 2021_04_12_165742) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actions", force: :cascade do |t|
    t.string "name"
    t.text "notes"
    t.datetime "ordered"
    t.integer "ordered_by"
    t.datetime "completed"
    t.integer "completed_by"
    t.integer "lot_id"
    t.integer "tank_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "email"
    t.string "priveledges"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "inventories", force: :cascade do |t|
    t.string "format"
    t.integer "quantity"
    t.integer "lot_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "lot_tanks", force: :cascade do |t|
    t.bigint "lot_id", null: false
    t.bigint "tank_id", null: false
    t.integer "volume"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["lot_id"], name: "index_lot_tanks_on_lot_id"
    t.index ["tank_id"], name: "index_lot_tanks_on_tank_id"
  end

  create_table "lots", force: :cascade do |t|
    t.string "name"
    t.integer "volume"
    t.integer "vintage"
    t.text "status"
    t.string "color"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "owner_id", null: false
    t.index ["owner_id"], name: "index_lots_on_owner_id"
  end

  create_table "owners", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tanks", force: :cascade do |t|
    t.string "name"
    t.string "material"
    t.text "status"
    t.integer "xaxis"
    t.integer "yaxis"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "winery_id", null: false
    t.integer "volume"
    t.integer "width"
    t.integer "height"
    t.index ["winery_id"], name: "index_tanks_on_winery_id"
  end

  create_table "wineries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "owner_id", null: false
    t.index ["owner_id"], name: "index_wineries_on_owner_id"
  end

  add_foreign_key "lot_tanks", "lots"
  add_foreign_key "lot_tanks", "tanks"
  add_foreign_key "lots", "owners"
  add_foreign_key "tanks", "wineries"
  add_foreign_key "wineries", "owners"
end
