class CreateMasterSalesFormats < ActiveRecord::Migration[6.0]
  def change
    create_table :master_sales_formats do |t|
      t.string :name, null: false, comment: "販売形式"
      t.boolean :delete_flg, default: false, null: false, comment: "削除フラグ"

      t.timestamps
    end
  end
end
