class CreateLives < ActiveRecord::Migration[6.0]
  def change
    create_table :lives do |t|
      t.string :code, null: false, comment: "ライブコード"

      t.string :title, null: false, comment: "ライブ名"
      t.text   :description, comment: "ライブ情報"
      t.string :thumbnail, comment: "ライブ画像"
      t.date   :date, null: false, comment: "開催日"
      t.string :venue, null: false, comment: "ライブ会場"
      t.string :website_url, comment: "関連サイトのURL"
      t.boolean :delete_flg, null: false, default: false, comment: "削除フラグ"

      t.timestamps
    end
  end
end
