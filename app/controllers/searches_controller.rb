# Search controller
class SearchesController < ApplicationController
  def index
    @places = Place.includes(:country, :city).all
    # @places = Place.includes { [:country, :city] }
    #                   .joins { [:country, :city] }
    #                   .where { ((country.name.eq 'Spain') | (city.name.eq 'Spain')) & (begins_at.gteq '2015-02-02') }
  end
end
