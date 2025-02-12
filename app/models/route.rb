class Route < ApplicationRecord
  validates :name, presence: :true

  has_many :station_routes
  has_many :railway_stations, through: :station_routes
  has_many :trains, foreign_key: :current_route_id
end