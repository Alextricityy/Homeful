class Recipient < ApplicationRecord
  belongs_to :user
  has_many :items
  has_many :locations
  accepts_nested_attributes_for :locations
  mount_uploader :photo, PhotoUploader

  validates :first_name, presence:true
  validates :gender, presence:true , inclusion: { in: %w(Male Female)}
  validates :dob, presence:true
  validates :bio, presence:true, length: { minimum: 100 }
  validates :photo, presence:true
end
