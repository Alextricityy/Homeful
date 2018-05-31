class Location < ApplicationRecord
  belongs_to :recipient
  validates :address, presence:true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  include PgSearch
  pg_search_scope :search_everything,
    against: [ :address, :latitude, :longitude ],
    associated_against: {
      recipient: [ :first_name, :last_name ]
    },
    using: {
      tsearch: { prefix: true }
    }
end
