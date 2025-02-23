class SearchesController < ApplicationController
  def new
    @stations = RailwayStation.all
  end

  def create
    redirect_to search_path(departure_station_id: params[:departure_station_id], arrival_station_id: params[:arrival_station_id])
  end

  def show
    @departure_station = RailwayStation.find(params[:departure_station_id])
    @arrival_station = RailwayStation.find(params[:arrival_station_id])

    @routes = Route.joins("JOIN railway_stations_routes AS departure_station ON routes.id = departure_station.route_id")
      .joins("JOIN railway_stations_routes AS arrival_station ON routes.id = arrival_station.route_id")
      .where("departure_station.railway_station_id = ? AND arrival_station.railway_station_id = ?",
        @departure_station.id, @arrival_station.id)
      .where("departure_station.position < arrival_station.position")
      .select("routes.*,
              departure_station.departure_time AS departure_time,
              arrival_station.arrival_time AS arrival_time")
      .distinct
  end
end