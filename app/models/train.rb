class Train < ApplicationRecord
  validates :number, presence: :true

  has_one :route
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
end
