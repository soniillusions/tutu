class RenameStationRoutes < ActiveRecord::Migration[7.1]
  def change
    rename_table('station_routes', 'railway_stations_routes')
  end
end
