class Item < ApplicationRecord
  monetize :price_cents
  belongs_to :recipient
  has_many :contributions
  validates :title, presence: true
  validates :description, presence: true
  validates :category, presence: true, inclusion: { in: ["Living", "Food", "Health", "Animal", "Education", "Transport", "Leisure"]}
  validates :cost, presence: true
end
