class DeviseCreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email,              null: false, comment: "メールアドレス"
      t.string :encrypted_password, null: false, comment: "hashパスワード"
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at

      t.string :name, null: false, comment: "本名（非公開）"
      t.string :nickname, null: false, comment: "表示名"
      t.string :thumbnail, comment: "アイコン"
      t.string :postal_code, null: false, comment: "郵便番号"
      t.string :address_1, null: false, comment: "都道府県"
      t.string :address_2, null: false, comment: "市区町村"
      t.string :address_3, null: false, comment: "番地等"
      t.boolean :delete_flg, null: false, default: false, comment: "削除フラグ"

      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
  end
end
