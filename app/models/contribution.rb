class Contribution < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :payment
  validates :amount_cents, presence: true
  monetize :amount_cents
end
