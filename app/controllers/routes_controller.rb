class RoutesController < ApplicationController
  before_action :set_route, only: %i[show edit update destroy]

  def index
    @routes = Route.all.order(created_at: :desc)
  end

  def show
    @stations = RailwayStation.joins(:railway_stations_routes).where(railway_stations_routes: { route_id: @route.id} ).order_by_position
  end

  def new
    @route = Route.new
    2.times { @route.railway_stations_routes.build } 
  end

  def edit;end

  def update
    if @route.update(route_params)
      flash[:success] = "Railway station updated successfully!"
      redirect_to @route
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def create
    @route = Route.new(route_params)

    if @route.save
      flash[:success] = "Route created successfully!"
      redirect_to @route
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @route.destroy!
    flash[:warning] = "Route deleted successfully!"
    redirect_to routes_path
  end

  private

  def route_params
    params.require(:route).permit(:name,
                                  railway_stations_routes_attributes: [:id, :railway_station_id, :position, :departure_time, :arrival_time, :_destroy])
  end

  def set_route
    @route = Route.find(params[:id])
  end
end