class SeatOnlyCarriage < Carriage
  validates :seating_seats, presence: true
end