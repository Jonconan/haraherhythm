class CreateMasterSnsServices < ActiveRecord::Migration[6.0]
  def change
    create_table :master_sns_services do |t|
      t.string :name, null: false, comment: "SNS名"
      t.boolean :delete_flg, null: false, default: false
    end
  end
end
