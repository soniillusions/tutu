class Carriage < ApplicationRecord
  belongs_to :train

  before_validation :set_number, on: :create

  validates :number, presence: true, uniqueness: { scope: :train_id }

  scope :economy, -> { where(type: 'EconomyCarriage') }
  scope :coupe, -> { where(type: 'CoupeCarriage') }
  scope :sv, -> { where(type: 'SvCarriage') }
  scope :seat_only, -> { where(type: 'SeatOnlyCarriage') }

  private

  def set_number
    last_number = train.carriages.pluck(:number).max || 0
    self.number = last_number + 1
  end
end
