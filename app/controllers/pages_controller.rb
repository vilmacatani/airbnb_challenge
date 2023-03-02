class PagesController < ApplicationController
  def home
    redirect_to offerings_path
  end

  def uikit
  end

  def map
    @offerings = Offering.all
    @markers = @offerings.geocoded.map do |offering|
      {
        lat: offering.latitude,
        lng: offering.longitude,
        # info_window: render_to_string(partial: "popup", locals: { offering: offering })
      }
    end
  end
end
