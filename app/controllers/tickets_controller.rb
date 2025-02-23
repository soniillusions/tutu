class TicketsController < ApplicationController
  def new
    @train = Train.find_by(id: params[:train_id])
    @ticket = current_user.tickets.build(train: @train, departure_station_id: params[:departure_station_id], arrival_station_id: params[:arrival_station_id] )
  end

  def show
    @ticket = current_user.tickets.find(params[:id])
  end

  def index
    @tickets = current_user.tickets
  end
  
  def create
    @ticket = current_user.tickets.build(ticket_params)

    if @ticket.save
      flash[:success] = 'Билет успешно куплен'
      redirect_to user_ticket_path(current_user, @ticket)
    else
      puts @ticket.errors.full_messages # Вывод ошибок в консоль
      render :new
    end
  end

  def destroy
    @ticket = current_user.tickets.find(params[:id])
    @ticket.destroy!
    flash[:success] = "Билет успешно сдан!"
    redirect_to user_tickets_path(current_user)
  end

  private

  def ticket_params
    params.require(:ticket).permit(:train_id, :user_id, :passenger_name, :passport_number, :departure_station_id, :arrival_station_id)
  end
end
