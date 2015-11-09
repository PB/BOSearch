# Country
class Country < ActiveRecord::Base
  has_many :places

  validates :name, presence: true, length: { maximum: 256 }
end
