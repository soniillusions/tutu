class AddPositionToRailwayStationsRoutes < ActiveRecord::Migration[7.1]
  def change
    add_column :railway_stations_routes, :position, :integer, null: false
  end
end
