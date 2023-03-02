class OfferingsController < ApplicationController
  before_action :set_offering, only: %i[show destroy edit update]

  def index
    @offerings = Offering.all
  end

  def show
    @bookings = Booking.where(offering_id: @offering)
    @reviews = Review.where(booking_id: @bookings)
    if @reviews.length > 0
      sum = 0
      @reviews.each { |review| sum += review.rating.to_i }
      @offering.average_rating = (sum.to_f / @reviews.length).round(2)
    else
      @offering.average_rating = 0
    end
    # how to update an already existing offering
    @offering.update(average_rating: @offering.average_rating)
  end

  def new
    @offering = Offering.new
  end

  def create
    @offering = Offering.new(offering_params)
    @offering.user = current_user
    if @offering.save
      redirect_to offerings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @offering.destroy
    redirect_to offerings_path, status: :see_other
  end

  def edit; end

  def update
    @offering.update(offering_params)
    redirect_to offering_path(@offering)
  end

  private

  def set_offering
    @offering = Offering.find(params[:id])
  end

  def offering_params
    params.require(:offering).permit(:property_type, :title, :available, :description, :price_per_night,
          :address, :country, :size, :city, :average_rating)
  end
end
