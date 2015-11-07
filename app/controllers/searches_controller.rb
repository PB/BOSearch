class SearchesController < ApplicationController
  def index
    @places = Place.includes(:country, :city).all
  end
end
