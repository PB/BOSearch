# Search controller
class SearchesController < ApplicationController
  def index
    @places = Place.includes(:country, :city).all
    # @places = Place.includes { [:country, :city] }
    #                   .joins { [:country, :city] }
    #                   .where { ((country.name.eq 'Spain') | (city.name.eq 'Spain')) & (begins_at.gteq '2015-02-02') }
  end

  def query
    respond_to do |format|
      unless params[:q].blank?
        format.js
      else
        format.js { render json: 'Error', status: :unprocessable_entity }
      end
    end
  end
end
