class Tank < ApplicationRecord
    validates :name, uniqueness: { case_sensitive: false, message: "Tank with this name already exists." }
    belongs_to :winery
    has_many :lot_tanks
    has_many :lots, through: :lot_tanks

end
