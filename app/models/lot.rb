class Lot < ApplicationRecord
    has_many :tanks
    belongs_to :winery
end
