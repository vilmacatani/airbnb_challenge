class BookingsController < ApplicationController
  before_action :set_offering, only: %i[new create]

  def index
    @my_bookings = Booking.where(user_id: current_user)
    @my_offerings = Offering.where(user_id: current_user)
    @my_offering_bookings = Booking.where(offering_id: @my_offerings)
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.pending = true
    @booking.accepted = false
    @booking.user = current_user
    @booking.offering = @offering

    if @booking.save
      redirect_to bookings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  def destroy; end

  def edit; end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def set_offering
    @offering = Offering.find(params[:offering_id])
  end
end
