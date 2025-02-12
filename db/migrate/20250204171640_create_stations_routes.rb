class CreateStationsRoutes < ActiveRecord::Migration[7.1]
  def change
    create_table :station_routes do |t|
      t.integer :railway_station_id
      t.integer :route_id
    end
  end
end
