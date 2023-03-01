class BookingsController < ApplicationController
  def index
    @my_bookings = Booking.where(user_id: current_user)
    @my_offerings = Offering.where(user_id: current_user)
    @my_offering_bookings = Booking.where(offering_id: @my_offerings)
  end

  def new; end

  def show; end

  def destroy; end

  def create; end

  def edit; end
end
