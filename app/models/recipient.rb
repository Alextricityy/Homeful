class Recipient < ApplicationRecord
  belongs_to :user
  has_many :items
  has_many :contributions, through: :items
  has_many :locations
  accepts_nested_attributes_for :locations
  mount_uploader :photo, PhotoUploader

  validates :first_name, presence:true
  validates :gender, presence:true , inclusion: { in: %w(Male Female Other)}
  validates :bio, presence:true
  validates :photo, presence:true
   include PgSearch
   # pg_search_scope :search, :against => :name
   pg_search_scope :search_everything,
    against: [ :first_name],
    using: {
      tsearch: { prefix: true }
    }
end
