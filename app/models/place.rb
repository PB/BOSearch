# Place
class Place < ActiveRecord::Base
  default_scope { order(begins_at: :asc) }

  belongs_to :country
  belongs_to :city
  delegate :name, to: :country, prefix: true
  delegate :name, to: :city, prefix: true

  sifter :country_or_city_contains do |string|
    countries.name.matches("%#{string}%") | cities.name.matches("%#{string}%")
  end
end
