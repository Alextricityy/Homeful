class Item < ApplicationRecord
  belongs_to :recipients
  has_many :contributions
end
