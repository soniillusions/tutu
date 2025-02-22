class RailwayStation < ApplicationRecord
  validates :title, presence: true

  has_many :trains
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

  scope :order_by_position, -> { 
    joins(:railway_stations_routes).order('railway_stations_routes.position ASC')
  }

  def position_in_route(route)
    railway_stations_routes.find_by(route: route)&.position
  end

  def departure_in_route(route)
    railway_stations_routes.find_by(route: route)&.departure_time
  end

  def arrival_in_route(route)
    railway_stations_routes.find_by(route: route)&.arrival_time
  end
end
