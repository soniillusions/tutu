class RailwayStationsRoute < ApplicationRecord
  belongs_to :railway_station
  belongs_to :route

  validates :railway_station_id, uniqueness: { scope: :route_id }
  validates :position, numericality: { only_integer: true, greater_than: 0 }, allow_nil: true
end 