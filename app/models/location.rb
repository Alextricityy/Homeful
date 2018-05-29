class Location < ApplicationRecord
  belongs_to :recipient
  validates :address, presence:true
end
