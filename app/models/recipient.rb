class Recipient < ApplicationRecord
  belongs_to :user
  has_many :items
  has_many :locations
  mount_uploader :photo, PhotoUploader

  validates :first_name, presence:true
  validates :gender, presence:true , inclusion: { in: %w(Male Female Other)}
  validates :dob, presence:true
  validates :bio, presence:true
  validates :photo, presence:true
end
