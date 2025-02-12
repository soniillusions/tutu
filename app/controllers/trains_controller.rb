class TrainsController < ApplicationController
  before_action :set_train, only: %i[ show edit update destroy ]

  def index
    @trains = Train.all.order(created_at: :desc)
  end

  def show;end

  def new
    @train = Train.new
  end

  def edit;end

  def create
    @train = Train.new(train_params)

    respond_to do |format|
      if @train.save
        flash[:success] = "Train created successfully!"
        format.html { redirect_to @train }
        format.json { render :show, status: :created, location: @train }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @train.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @train.update(train_params)
        flash[:success] = "Train was successfully updated!"
        format.html { redirect_to @train }
        format.json { render :show, status: :ok, location: @train }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @train.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @train.destroy!

    respond_to do |format|
      flash[:warning] = "Train deleted successfully!"
      format.html { redirect_to trains_path, status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    def set_train
      @train = Train.find(params[:id])
    end

    def train_params
      params.require(:train).permit(:number, :current_station_id, :current_route_id)
    end
end
