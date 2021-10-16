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

ActiveRecord::Schema.define(version: 2021_10_16_063855) do

  create_table "artist_sns_accounts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "artist_id"
    t.bigint "master_sns_service_id"
    t.string "account_path", null: false, comment: "アカウント名"
    t.index ["artist_id"], name: "index_artist_sns_accounts_on_artist_id"
    t.index ["master_sns_service_id"], name: "index_artist_sns_accounts_on_master_sns_service_id"
  end

  create_table "artists", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "code", null: false, comment: "アーティストコード"
    t.string "email", null: false, comment: "Email"
    t.string "encrypted_password", null: false, comment: "hashパスワード"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
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
    t.index ["email"], name: "index_artists_on_email", unique: true
    t.index ["reset_password_token"], name: "index_artists_on_reset_password_token", unique: true
  end

  create_table "event_artists", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "artist_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["artist_id"], name: "index_event_artists_on_artist_id"
    t.index ["event_id"], name: "index_event_artists_on_event_id"
  end

  create_table "events", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "code", null: false, comment: "ライブコード"
    t.string "title", null: false, comment: "ライブ名"
    t.text "description", comment: "ライブ情報"
    t.string "thumbnail", comment: "ライブ画像"
    t.date "date", null: false, comment: "開催日"
    t.string "venue", null: false, comment: "ライブ会場"
    t.string "website_url", comment: "関連サイトのURL"
    t.boolean "delete_flg", default: false, null: false, comment: "削除フラグ"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "item_events", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "item_id"
    t.bigint "event_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_item_events_on_event_id"
    t.index ["item_id"], name: "index_item_events_on_item_id"
  end

  create_table "item_partners", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "item_id"
    t.bigint "artist_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["artist_id"], name: "index_item_partners_on_artist_id"
    t.index ["item_id"], name: "index_item_partners_on_item_id"
  end

  create_table "item_tags", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "item_id"
    t.bigint "tag_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_item_tags_on_item_id"
    t.index ["tag_id"], name: "index_item_tags_on_tag_id"
  end

  create_table "items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "artist_id"
    t.string "code", null: false, comment: "商品コード"
    t.string "thumbnail", null: false, comment: "商品画像"
    t.string "name", null: false, comment: "商品名"
    t.integer "price", null: false, comment: "価格"
    t.integer "sales_format_id", null: false, comment: "販売形式"
    t.integer "delivery_days", comment: "発送までの日数"
    t.text "description", comment: "商品紹介"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["artist_id"], name: "index_items_on_artist_id"
  end

  create_table "master_sales_formats", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false, comment: "販売形式"
    t.boolean "delete_flg", default: false, null: false, comment: "削除フラグ"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "master_sns_services", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false, comment: "SNS名"
    t.boolean "delete_flg", default: false, null: false
  end

  create_table "tags", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false, comment: "タグの内容"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_artists", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "artist_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["artist_id"], name: "index_user_artists_on_artist_id"
    t.index ["user_id"], name: "index_user_artists_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email", null: false, comment: "メールアドレス"
    t.string "encrypted_password", null: false, comment: "hashパスワード"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name", null: false, comment: "本名（非公開）"
    t.string "nickname", null: false, comment: "表示名"
    t.string "thumbnail", comment: "アイコン"
    t.string "postal_code", null: false, comment: "郵便番号"
    t.string "address_1", null: false, comment: "都道府県"
    t.string "address_2", null: false, comment: "市区町村"
    t.string "address_3", null: false, comment: "番地等"
    t.boolean "delete_flg", default: false, null: false, comment: "削除フラグ"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "artist_sns_accounts", "artists"
  add_foreign_key "event_artists", "artists"
  add_foreign_key "event_artists", "events"
  add_foreign_key "item_events", "events"
  add_foreign_key "item_events", "items"
  add_foreign_key "item_partners", "artists"
  add_foreign_key "item_partners", "items"
  add_foreign_key "item_tags", "items"
  add_foreign_key "item_tags", "tags"
  add_foreign_key "items", "artists"
  add_foreign_key "user_artists", "artists"
  add_foreign_key "user_artists", "users"
end
