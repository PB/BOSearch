# Place
class Place < ActiveRecord::Base
  belongs_to :country
  belongs_to :city
  delegate :name, to: :country, prefix: true
  delegate :name, to: :city, prefix: true
end
