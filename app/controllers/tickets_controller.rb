class TicketsController < ApplicationController
  def create
    @ticket = Ticket.new(ticket_params)
  end
end
