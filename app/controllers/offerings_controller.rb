class OfferingsController < ApplicationController
  before_action :set_offering, only: %i[show destroy edit update]

  def index
    @offerings = Offering.all
    @markers = @offerings.geocoded.map do |offering|
      {
        lat: offering.latitude,
        lng: offering.longitude
      }
    end
  end

  def show; end

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
    redirect_to offerings_path
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
          :address, :country, :size, :city)
  end
end
