class Train < ApplicationRecord
  validates :number, presence: :true

  has_one :route
  has_many :carriages
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  belongs_to :current_route, class_name: 'Route', foreign_key: :current_route_id
  
  def sorted_carriages
    sort_from_head ? carriages.order(number: :asc) : carriages.order(number: :desc)
  end
end
