class Item < ApplicationRecord
  belongs_to :artist
  mount_uploader :thumbnail, ImageUploader

  belongs_to :sales_format, class_name: 'MasterSalesFormat', foreign_key: :sales_format_id
end
