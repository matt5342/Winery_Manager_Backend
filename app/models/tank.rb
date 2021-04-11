class Tank < ApplicationRecord
    validates :name, uniqueness: { case_sensitive: false, message: "Tank with this name already exists." }
    belongs_to :winery
    # :has_one :lot
end
