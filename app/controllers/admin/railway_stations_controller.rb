# frozen_string_literal: true

module Admin
  class RailwayStationsController < BaseController
    before_action :set_railway_station, only: %i[ show edit update destroy ]

    def index
      @railway_stations = RailwayStation.all.order(created_at: :desc)
    end

    def show
    end

    def new
      @railway_station = RailwayStation.new
    end

    def edit
    end

    def create
      @railway_station = RailwayStation.new(railway_station_params)

      if @railway_station.save
        flash[:success] = "Railway station created successfully!"
        redirect_to admin_railway_station_path(@railway_station)
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      if @railway_station.update(railway_station_params)
        flash[:success] = "Railway station updated successfully!"
        redirect_to admin_railway_station_path(@railway_station)
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @railway_station.destroy!
      flash[:warning] = "Railway station deleted successfully!"
      redirect_to admin_railway_stations_path, status: :see_other
    end

    private
      def set_railway_station
        @railway_station = RailwayStation.find(params[:id])
      end

      def railway_station_params
        params.require(:railway_station).permit(:title)
      end
  end
end