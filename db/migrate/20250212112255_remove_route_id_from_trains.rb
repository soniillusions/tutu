class RemoveRouteIdFromTrains < ActiveRecord::Migration[7.1]
  def change
    remove_index :trains, :route_id if index_exists?(:trains, :route_id)
    remove_column :trains, :route_id, :integer
  end
end
