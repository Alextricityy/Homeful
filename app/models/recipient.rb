class Recipient < ApplicationRecord
  belongs_to :user
  has_many :items
  has_many :locations
  accepts_nested_attributes_for :locations
  mount_uploader :photo, PhotoUploader

  validates :first_name, presence:true
  validates :gender, presence:true , inclusion: { in: %w(Male Female Other)}
  validates :date_of_birth, presence:true
  validates :bio, presence:true, length: { minimum: 100 }
  validates :photo, presence:true
   include PgSearch
   # pg_search_scope :search, :against => :name
   pg_search_scope :search_everything,
    against: [ :first_name, :location, :bio ],
    using: {
      tsearch: { prefix: true }
    }
end
