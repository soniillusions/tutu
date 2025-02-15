class AddTrainIdToRoute < ActiveRecord::Migration[7.1]
  def change
    add_reference :routes, :train, null: true, foreign_key: true
  end
end
