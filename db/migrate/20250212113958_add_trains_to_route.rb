class AddTrainsToRoute < ActiveRecord::Migration[7.1]
  def change
    add_reference :routes, :trains, null: true, foreign_key: true
  end
end
