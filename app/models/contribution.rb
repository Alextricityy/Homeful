class Contribution < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :payment
end
