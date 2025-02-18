class Route < ApplicationRecord
  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes
  has_many :trains, foreign_key: :current_route_id, dependent: :nullify

  validates :name, presence: :true
  validate :stations_count

  accepts_nested_attributes_for :railway_stations_routes, allow_destroy: true

  before_validation :set_name

  private

  def set_name
    self.name ||= "#{railway_stations.first.title} - #{railway_stations.last.title}"
  end

  def stations_count
    valid_stations = railway_stations_routes.reject do |rsr| 
      rsr.marked_for_destruction? || rsr.railway_station_id.blank?
    end

    if valid_stations.size < 2
      errors.add(:base, "Route should contain at least 2 stations")
    end
  end
end