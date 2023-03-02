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
    @bookings = Booking.where(offering_id: @offering)
    # we have to check for availability
    available = check_availability(@booking, @bookings)
    if available
      @booking.pending = true
      @booking.accepted = false
      @booking.user = current_user
      @booking.offering = @offering

      if @booking.save
        redirect_to bookings_path
      else
        render :new, status: :unprocessable_entity
      end
    else
      redirect_to new_offering_booking_path(@offering)
      flash[:alert] = 'This booking is not available for those days'
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
    else
      @booking.accepted = false
    end

    @booking.save
    redirect_to bookings_path
  end

  def check_availability(new_booking, existing_bookings)
    new_booking_range = (new_booking.start_date..new_booking.end_date)
    available = true
    existing_bookings.each do |existing_booking|
      existing_booking_range = (existing_booking.start_date..existing_booking.end_date)
      if (new_booking_range.overlaps? existing_booking_range) && existing_booking.accepted
        available = false
        break
      end
    end
    return available
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def set_offering
    @offering = Offering.find(params[:offering_id])
  end
end
