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

  def update_booking_status_of_my_offering
    @booking = Booking.find(params[:booking])
    @booking.pending = false

    if params[:status] == "accept"
      @booking.accepted = true
      # @booking.offering.available = false
    else
      @booking.accepted = false
    end

    @booking.save
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def set_offering
    @offering = Offering.find(params[:offering_id])
  end

end
