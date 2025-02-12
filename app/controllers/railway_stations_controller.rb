class RailwayStationsController < ApplicationController
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

    respond_to do |format|
      if @railway_station.save
        flash[:success] = "Railway station created successfully!"
        format.html { redirect_to @railway_station }
        format.json { render :show, status: :created, location: @railway_station }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @railway_station.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @railway_station.update(railway_station_params)
        flash[:success] = "Railway station updated successfully!"
        format.html { redirect_to @railway_station }
        format.json { render :show, status: :ok, location: @railway_station }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @railway_station.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @railway_station.destroy!

    respond_to do |format|
      flash[:warning] = "Railway station deleted successfully!"
      format.html { redirect_to railway_stations_path, status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    def set_railway_station
      @railway_station = RailwayStation.find(params[:id])
    end

    def railway_station_params
      params.require(:railway_station).permit(:title)
    end
end
