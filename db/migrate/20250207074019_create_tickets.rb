class CreateTickets < ActiveRecord::Migration[7.1]
  def change
    create_table :tickets do |t|
      t.references :train, null: false, foreign_key: true
      t.references :departure_station, null: false, foreign_key: { to_table: :railway_stations }
      t.references :arrival_station, null: false, foreign_key: { to_table: :railway_stations }
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
