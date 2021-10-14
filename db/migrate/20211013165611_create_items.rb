class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :artist, foreign_key: true

      t.string :code, null: false, comment: "商品コード"
      t.string :thumbnail, null: false, comment: "商品画像"
      t.string :name, null: false, comment: "商品名"
      t.integer :price, null: false, comment: "価格"
      t.integer :sales_format_id, null: false, comment: "販売形式"
      t.integer :delivery_days, comment: "発送までの日数"
      t.text   :description, comment: "商品紹介"

      t.timestamps
    end
  end
end
