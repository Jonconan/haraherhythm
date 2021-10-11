class CreateLiveArtists < ActiveRecord::Migration[6.0]
  def change
    create_table :live_artists do |t|
      t.references :live, foreign_key: true
      t.references :artist, foreign_key: true

      t.timestamps
    end
  end
end
