# frozen_string_literal: true

module Admin
  class TrainsController < BaseController
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

      if @train.save
        flash[:success] = "Поезд успешно создан!"
        redirect_to admin_train_path(@train)
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      if @train.update(train_params)
        flash[:success] = "Поезд успешно обновлен!"
        redirect_to admin_train_path(@train)
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @train.destroy!
      flash[:warning] = "Поезд успешно удален!"
      redirect_to admin_trains_path, status: :see_other
    end

    private
      def set_train
        @train = Train.find(params[:id])
      end

      def train_params
        params.require(:train).permit(:number, :current_station_id, :current_route_id, :sort_from_head)
      end
  end
end