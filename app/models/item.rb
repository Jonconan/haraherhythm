class Item < ApplicationRecord
  belongs_to :artist
  mount_uploader :thumbnail, ImageUploader

  has_one :master_sales_format

  def sales_format
    return nil unless sales_format_id.present?
    MasterSalesFormat.find_by(id: sales_format_id).name
  end
end
