class AddSortFlagToTrain < ActiveRecord::Migration[7.1]
  def change
    add_column :trains, :sort_from_head, :boolean, default: true
  end
end
