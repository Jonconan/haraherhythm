class MasterSnsService < ApplicationRecord
  scope :sns_service_id, -> (name) {
    find_by(name: name).id
  }
end
