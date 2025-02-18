class RailwayStation < ApplicationRecord
  validates :title, presence: true

  has_many :trains
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

  def position_in_route(route)
    railway_stations_routes.find_by(route: route)&.position
  end
end
