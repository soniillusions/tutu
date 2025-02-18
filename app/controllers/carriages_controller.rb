class CarriagesController < ApplicationController
  before_action :set_train
  before_action :set_carriage, only: %i[show edit update destroy]
  
  def new
    @carriage = Carriage.new
  end

  def index
    @carriages = @train.carriages.order(created_at: :desc)
  end

  def show;end

  def edit
    @carriage = Carriage.find(params[:id])
    @carriage_for_form = @carriage.becomes(Carriage)
  end

  def create
    @carriage = @train.carriages.build(carriage_params)

    if @carriage.save
      flash[:success] = 'Вагон успешно сохранен!'
      redirect_to train_carriages_path(@train)
    else
      render :new
    end
  end

  def update
    if @carriage.update(carriage_params)
      flash[:success] = 'Данные вагона успешно обновлены!'
      redirect_to train_carriages_path(@train)
    else
      render :edit
    end
  end

  def destroy
    @carriage.destroy!
    flash[:warning] = 'Вагон успешно удален!'
    redirect_to train_carriages_path(@train)
  end

  private

  def carriage_params
    params.require(:carriage).permit(:number, :top_seats, :bottom_seats, :side_top_seats, 
    :side_bottom_seats, :seating_seats, :train_id, :type)
  end

  def set_carriage
    @carriage = @train.carriages.find(params[:id])
  end

  def set_train
    @train = Train.find(params[:train_id])
  end
end