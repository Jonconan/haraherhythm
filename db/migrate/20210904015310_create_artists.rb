class CreateArtists < ActiveRecord::Migration[6.0]
  def change
    create_table :artists do |t|
      t.string :code, null: false, comment: "アーティストコード"

      t.string :email, null: false, comment: "Email"
      t.string :encrypted_password, null: false, comment: "hashパスワード"
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at

      t.string :name, null: false, comment: "本名（非公開）"
      t.string :nickname, null: false, comment: "表示名"
      t.string :thumbnail, comment: "アイコン"
      t.text   :description, comment: "自己紹介"
      t.date   :birthday, comment: "誕生日"
      t.string :postal_code, null: false, comment: "郵便番号"
      t.string :address_1, null: false, comment: "都道府県"
      t.string :address_2, null: false, comment: "市区町村"
      t.string :address_3, null: false, comment: "番地等"
      t.string :website_url, comment: "WebサイトのURL"
      t.boolean :delete_flg, null: false, default: false, comment: "削除フラグ"

      t.timestamps
    end

    add_index :artists, :email,                unique: true
    add_index :artists, :reset_password_token, unique: true
  end
end
