class Carriage < ApplicationRecord
  belongs_to :train

  validates :number, presence: true

  scope :economy, -> { where(type: 'EconomyCarriage') }
  scope :coupe, -> { where(type: 'CoupeCarriage') }
  scope :sv, -> { where(type: 'SvCarriage') }
  scope :seat_only, -> { where(type: 'SeatOnlyCarriage') }
end
