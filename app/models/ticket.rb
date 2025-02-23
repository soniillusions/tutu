class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :train
  belongs_to :departure_station, class_name: "RailwayStation"
  belongs_to :arrival_station, class_name: "RailwayStation"

  validates :train, :departure_station, :arrival_station, presence: true
end