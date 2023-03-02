class Offering < ApplicationRecord
  CATEGORIES = ["Appartment", "Villa", "House", "Hostel", "Hotel"]
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :property_type, inclusion: { in: CATEGORIES }
end
