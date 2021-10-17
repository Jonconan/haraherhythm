class Artist < ApplicationRecord
  has_many :artist_sns_accounts
  mount_uploader :thumbnail, ImageUploader
  has_many :event_artists
  has_many :events, through: :event_artists
  has_many :items
  has_many :user_artists, -> { order(id: :desc) }
  has_many :users, through: :user_artists
  attr_accessor :twitter, :facebook, :instagram, :youtube

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
    account = artist_sns_accounts.find_by(
      master_sns_service_id: MasterSnsService.sns_service_id(sns_name)
    )
    return account.account_path if account.present?
    nil
  end

  def followed?(user: nil)
    users.ids.include?(user.id)
  end
end
