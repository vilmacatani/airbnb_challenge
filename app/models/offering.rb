class Offering < ApplicationRecord
  CATEGORIES = ["Appartment", "Villa", "House", "Hostel", "Hotel"]
  belongs_to :user
  has_many :bookings, dependent: :destroy
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  validates :property_type, inclusion: { in: CATEGORIES }
end
