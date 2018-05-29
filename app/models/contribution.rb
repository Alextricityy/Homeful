class Contribution < ApplicationRecord
  belongs_to :users
  belongs_to :items
end
