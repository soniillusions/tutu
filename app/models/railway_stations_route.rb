class RailwayStationsRoute < ApplicationRecord
  belongs_to :railway_station
  belongs_to :route

  validates :railway_station_id, uniqueness: { scope: :route_id }
  validates :position, numericality: { only_integer: true, greater_than: 0 }, allow_nil: true

  validate :arrival_after_departure

  def arrival_after_departure
    return if arrival_time.blank? || departure_time.blank?
    errors.add(:arrival_time, "должно быть позже времени отправления") if departure_time <= arrival_time
  end
end