class OfferingsController < ApplicationController
  before_action :set_offering, only: %i[show destroy edit]
  def index
    @offerings = Offering.all
  end

  def show; end

  def new
    @offering = Offering.new
  end

  def create
    @offering = Offering.new(offering_params)
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

  def set_offering
    @offering = Offering.find(params[:id])
  end

  def offering_params
    params.require(:offering).permit(:title, :available, :description, :type, :price_per_night,
          :address, :country, :size)
  end
end
