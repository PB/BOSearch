# Search controller
class SearchesController < ApplicationController
  def index
    @places = Place.includes(:country, :city).all
  end

  def query
    prepare_search
    respond_to do |format|
      if !params[:q].blank? || !params[:from].blank?
        format.js
      else
        format.js { render json: 'Error', status: :unprocessable_entity }
      end
    end
  end

  private

  def prepare_search
    @places = Place.includes(:country, :city)
    country_city_search
    date_search
  end

  def country_city_search
    false if params[:q].blank?
    q = params[:q]
    @places = @places.joins { [:country, :city] }.where { sift :country_or_city_contains, q }
  end

  def date_search
    false if check_date_params
    min_date = count_date
    end_date = params[:to]
    @places = @places.where { ends_at.gteq(min_date) & begins_at.lteq(end_date) }
  end

  def count_date
    Date.strptime(params[:from], '%Y-%m-%d') + params[:min].to_i.days
  end

  def check_date_params
    params[:min].blank? || params[:from].blank? || params[:to].blank?
  end
end
