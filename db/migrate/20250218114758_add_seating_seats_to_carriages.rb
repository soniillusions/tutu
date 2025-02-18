class AddSeatingSeatsToCarriages < ActiveRecord::Migration[7.1]
  def change
    add_column :carriages, :seating_seats, :integer
  end
end
