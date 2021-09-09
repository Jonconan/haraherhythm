class Artist < ApplicationRecord
  has_many :artist_sns_accounts
  has_one_attached :thumbnail

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :code, presence: true
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :name, presence: true
  validates :nickname, presence: true
  validates :postal_code, presence: true
  validates :address_1, presence: true
  validates :address_2, presence: true
  validates :address_3, presence: true


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def sns_account(sns_name: nil)
    artist_sns_accounts.find_by(
      master_sns_service_id: MasterSnsService.sns_service_id(sns_name)
    )
  end
end
