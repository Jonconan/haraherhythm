class CreateItemEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :item_events do |t|
      t.references :item, foreign_key: true
      t.references :event, foreign_key: true
      t.timestamps
    end
  end
end
