class Item < ApplicationRecord
  belongs_to :recipients
  has_many :contributions
  validates :title, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates :cost, presence: true
end
