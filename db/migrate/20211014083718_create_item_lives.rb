class CreateItemLives < ActiveRecord::Migration[6.0]
  def change
    create_table :item_lives do |t|
      t.references :item, foreign_key: true
      t.references :live, foreign_key: true
      t.timestamps
    end
  end
end
