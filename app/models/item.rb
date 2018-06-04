class Item < ApplicationRecord
  monetize :price_cents
  belongs_to :recipient
  has_many :contributions
  validates :title, presence: true
  validates :description, presence: true
  validates :category, presence: true, inclusion: { in: ["Living", "Food", "Health", "Animal", "Education", "Transport", "Leisure"]}
  validates :price_cents, presence: true

  # def category_background
  #   if category == 'Living'
  #     return "-225deg, rgba(0,101,168,0.6) 0%, rgba(0,36,61,0.6) 50%"
  #   elsif category == 'Food'
  #     return "-225deg, rgba(0,101,168,0.6) 0%, rgba(0,36,61,0.6) 50%"
  #     elsif category == 'Health'
  #     return "grad2.png"
  #     elsif category == 'Health'
  #     return "grad2.png"
  #     elsif category == 'Health'
  #     return "grad2.png"
  #     elsif category == 'Health'
  #     return "grad2.png"
  #     elsif category == 'Health'
  #     return "grad2.png"
  #     elsif category == 'Health'
  #     return "grad2.png"
  #   end
  # end
end
