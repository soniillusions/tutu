class AddRouteToTrains < ActiveRecord::Migration[7.1]
  def change
    add_reference :trains, :route, null: true, foreign_key: true
  end
end
