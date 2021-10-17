class ItemEvent < ApplicationRecord
  belongs_to :item, optional: true
  belongs_to :event
end
