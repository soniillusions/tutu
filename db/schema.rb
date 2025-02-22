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

ActiveRecord::Schema[7.1].define(version: 2025_02_22_141448) do
  create_table "carriages", force: :cascade do |t|
    t.integer "number"
    t.integer "top_seats"
    t.integer "bottom_seats"
    t.integer "side_top_seats"
    t.integer "side_bottom_seats"
    t.integer "train_id"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "seating_seats"
    t.index ["train_id"], name: "index_carriages_on_train_id"
  end

  create_table "railway_stations", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "railway_stations_routes", force: :cascade do |t|
    t.integer "railway_station_id"
    t.integer "route_id"
    t.integer "position", null: false
    t.datetime "departure_time"
    t.datetime "arrival_time"
  end

  create_table "routes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "train_id"
    t.index ["train_id"], name: "index_routes_on_train_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.integer "train_id", null: false
    t.integer "departure_station_id", null: false
    t.integer "arrival_station_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["arrival_station_id"], name: "index_tickets_on_arrival_station_id"
    t.index ["departure_station_id"], name: "index_tickets_on_departure_station_id"
    t.index ["train_id"], name: "index_tickets_on_train_id"
    t.index ["user_id"], name: "index_tickets_on_user_id"
  end

  create_table "trains", force: :cascade do |t|
    t.string "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "railway_station_id"
    t.integer "current_station_id"
    t.integer "current_route_id"
    t.string "sord_order", default: "head"
    t.boolean "sort_from_head", default: true
    t.index ["current_route_id"], name: "index_trains_on_current_route_id"
    t.index ["current_station_id"], name: "index_trains_on_current_station_id"
    t.index ["railway_station_id"], name: "index_trains_on_railway_station_id"
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

  add_foreign_key "routes", "trains"
  add_foreign_key "tickets", "railway_stations", column: "arrival_station_id"
  add_foreign_key "tickets", "railway_stations", column: "departure_station_id"
  add_foreign_key "tickets", "trains"
  add_foreign_key "tickets", "users"
  add_foreign_key "trains", "routes", column: "current_route_id"
end
