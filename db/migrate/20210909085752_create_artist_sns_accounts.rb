class CreateArtistSnsAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :artist_sns_accounts do |t|
      t.references :artist, foreign_key: true
      t.references :master_sns_service
      t.string :account_path, null: false, comment: 'アカウント名'
    end
  end
end
