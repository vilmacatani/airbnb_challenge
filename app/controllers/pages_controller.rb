class PagesController < ApplicationController
  def home
    redirect_to offerings_path
  end
end
