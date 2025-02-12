class AddCurrentRouteIdToTrain < ActiveRecord::Migration[7.1]
  def change
    add_reference :trains, :current_route, foreign_key: { to_table: :routes }
  end
end
