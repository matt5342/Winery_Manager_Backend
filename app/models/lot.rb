class Lot < ApplicationRecord
    has_many :lot_tanks
    has_many :tanks, through: :lot_tanks
    has_many :work_orders
    belongs_to :owner
end
