module Admin
  class TicketsController < ApplicationController
    before_action :set_ticket, only: [:show, :edit, :update, :destroy]

    def index
      @tickets = Ticket.all
    end

    def show;end

    def edit;end

    def update
      if @ticket.update(ticket_params)
        flash[:success] = 'Билет успешно изменен!'
        redirect_to admin_tickets_path
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @ticket.destroy!
      flash[:success] = 'Билет удален из системы!'
      redirect_to admin_tickets_path
    end

    private

    def ticket_params
      params.require(:ticket).permit(:train_id, :user_id, :passenger_name, :passport_number, :departure_station_id, :arrival_station_id)
    end

    def set_ticket
      @ticket = Ticket.find(params[:id])
    end
  end
end