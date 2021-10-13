class CreateTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tags do |t|
      t.string :name, null: false, comment: "タグの内容"

      t.timestamps
    end
  end
end
