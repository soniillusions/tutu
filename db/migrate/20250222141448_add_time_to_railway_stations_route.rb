class AddTimeToRailwayStationsRoute < ActiveRecord::Migration[7.1]
  def change
    add_column :railway_stations_routes, :departure_time, :datetime
    add_column :railway_stations_routes, :arrival_time, :datetime
  end
end
