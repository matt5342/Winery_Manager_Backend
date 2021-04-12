class Lot < ApplicationRecord
    has_many :lot_tanks
    has_many :tanks, through: :lot_tanks
    belongs_to :owner
end
