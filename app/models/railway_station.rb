class RailwayStation < ApplicationRecord
  validates :title, presence: true

  has_many :trains
  has_many :station_routes
  has_many :routes, through: :station_routes
end
