class RoutesController < ApplicationController
  before_action :set_route, only: %i[show edit update destroy]

  def index
    @routes = Route.all.order(created_at: :desc)
  end

  def show;end

  def new
    @route = Route.new
  end

  def edit;end

  def update
    if @route.update(route_params)
      flash[:success] = "Railway station updated successfully!"
      redirect_to @route
    else
      render :edit
    end
  end

  def create
    @route = Route.new(route_params)

    if @route.save
      flash[:success] = "Route created successfully!"
      redirect_to @route
    else
      render :new
    end
  end

  def destroy
    @route.destroy!
    flash[:warning] = "Route deleted successfully!"
    redirect_to routes_path
  end

  private

  def route_params
    params.require(:route).permit(:name)
  end

  def set_route
    @route = Route.find(params[:id])
  end
end