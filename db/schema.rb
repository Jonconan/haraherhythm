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

ActiveRecord::Schema.define(version: 2021_09_04_015310) do

  create_table "artists", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false, comment: "本名（非公開）"
    t.string "nickname", null: false, comment: "表示名"
    t.string "thumbnail", comment: "アイコン"
    t.text "description", comment: "自己紹介"
    t.date "birthday", comment: "誕生日"
    t.string "postal_code", null: false, comment: "郵便番号"
    t.string "address_1", null: false, comment: "都道府県"
    t.string "address_2", null: false, comment: "市区町村"
    t.string "address_3", null: false, comment: "番地等"
    t.string "website_url", comment: "WebサイトのURL"
    t.boolean "delete_flg", default: false, null: false, comment: "削除フラグ"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
