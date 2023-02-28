class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :offering

  has_many :reviews, dependent: :destroy
end
