class RemoveTrainsIdFromRoutes < ActiveRecord::Migration[7.1]
  def change
    remove_column :routes, :trains_id
  end
end
