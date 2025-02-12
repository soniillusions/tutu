class ChangeRouteIdInTrainsNullFalse < ActiveRecord::Migration[7.1]
  def change
    change_column_null :trains, :route_id, false
  end
end
