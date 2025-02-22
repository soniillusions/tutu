class Train < ApplicationRecord
  validates :number, presence: :true

  has_one :route
  has_many :carriages
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  belongs_to :current_route, class_name: 'Route', foreign_key: :current_route_id

  validate :arrival_after_departure

  def sorted_carriages
    sort_from_head ? carriages.order(number: :asc) : carriages.order(number: :desc)
  end

  def arrival_afrer_departure
    return if arrival_time.blank? || departure_time.blank?
    errors.add(:arrival_time, "должно быть позже времени отправления") if arrival_time <= departure_time
  end
end
