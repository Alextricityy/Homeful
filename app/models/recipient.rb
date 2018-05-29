class Recipient < ApplicationRecord
  belongs_to :users
  has_many :items
  has_many :locations
end
