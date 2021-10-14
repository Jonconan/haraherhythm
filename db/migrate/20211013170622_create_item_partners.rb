class CreateItemPartners < ActiveRecord::Migration[6.0]
  def change
    create_table :item_partners do |t|
      t.references :item, foreign_key: true
      t.references :artist, foreign_key: true

      t.timestamps
    end
  end
end
