class Route < ApplicationRecord
  validates :name, presence: :true

  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes
  has_many :trains, foreign_key: :current_route_id, dependent: :nullify

  before_create :set_name

  private

  def set_name
    self.name = "#{self.railway_stations.first.title} - #{railway_stations.last.title}"
  end
end