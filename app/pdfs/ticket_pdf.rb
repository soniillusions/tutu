require 'prawn'

class TicketPdf < Prawn::Document
  def initialize(ticket)
    super()

    font_families.update(
      'Custom' => {
        normal: Rails.root.join('app/assets/fonts/FreeSans.ttf'),
        bold: Rails.root.join('app/assets/fonts/FreeSansBold.ttf')
      }
    )

    font 'Custom'

    text "Билет #{ticket.id}", size: 30, style: :bold
    move_down 20
    text "Имя пассажира: #{ticket.passenger_name}"
    text "Паспортные данные: #{ticket.passport_number}"
    text "Станция отправления: #{ticket.departure_station.title}"
    text "Станция прибытия: #{ticket.arrival_station.title}"
    text "Номер поезда: #{ticket.train_id}"
  end
end