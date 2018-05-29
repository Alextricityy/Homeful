class Location < ApplicationRecord
  belongs_to :recipients
  validates :address, presence:true
end
