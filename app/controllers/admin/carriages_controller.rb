# frozen_string_literal: true

module Admin
  class CarriagesController < BaseController
    before_action :set_train
    before_action :set_carriage, only: %i[show edit update destroy]
    
    def new
      @carriage = @train.carriages.build
      @carriage_for_form = @carriage.becomes(Carriage)
    end

    def index
      @carriages = @train.sorted_carriages
    end

    def show;end

    def edit
      @carriage_for_form = @carriage.becomes(Carriage)
    end

    def create
      @carriage = @train.carriages.build(carriage_params)

      if @carriage.save
        flash[:success] = 'Вагон успешно сохранен!'
        redirect_to admin_train_carriages_path(@train)
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      if @carriage.update(carriage_params)
        flash[:success] = 'Данные вагона успешно обновлены!'
        redirect_to admin_train_carriage_path(@train, @carriage)
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @carriage.destroy!
      flash[:warning] = 'Вагон успешно удален!'
      redirect_to admin_train_carriages_path(@train)
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
end