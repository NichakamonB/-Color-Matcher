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

ActiveRecord::Schema[8.0].define(version: 2025_11_19_161836) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "color_matches", id: :serial, force: :cascade do |t|
    t.integer "color1_id", null: false
    t.integer "color2_id", null: false
    t.decimal "match_score", precision: 5, scale: 2, null: false
    t.timestamptz "created_at", default: -> { "CURRENT_TIMESTAMP" }
    t.check_constraint "match_score >= 0::numeric AND match_score <= 100::numeric", name: "color_matches_match_score_check"
  end

  create_table "colors", id: :serial, force: :cascade do |t|
    t.string "name", limit: 50, null: false
    t.string "hex_code", limit: 7, null: false
    t.integer "rgb_r", null: false
    t.integer "rgb_g", null: false
    t.integer "rgb_b", null: false
    t.timestamptz "created_at", default: -> { "CURRENT_TIMESTAMP" }
    t.timestamptz "updated_at", default: -> { "CURRENT_TIMESTAMP" }
    t.string "category"
    t.check_constraint "rgb_b >= 0 AND rgb_b <= 255", name: "colors_rgb_b_check"
    t.check_constraint "rgb_g >= 0 AND rgb_g <= 255", name: "colors_rgb_g_check"
    t.check_constraint "rgb_r >= 0 AND rgb_r <= 255", name: "colors_rgb_r_check"
  end

  add_foreign_key "color_matches", "colors", column: "color1_id", name: "color_matches_color1_id_fkey", on_delete: :cascade
  add_foreign_key "color_matches", "colors", column: "color2_id", name: "color_matches_color2_id_fkey", on_delete: :cascade
end
