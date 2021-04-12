class LotTank < ApplicationRecord
  belongs_to :lot
  belongs_to :tank
end
