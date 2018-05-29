class Contribution < ApplicationRecord
  belongs_to :users
  belongs_to :items
  has_one :payment
end
