class EconomCarriage < Carriage
  validates :side_top_seats, :side_bottom_seats, presence: true
end