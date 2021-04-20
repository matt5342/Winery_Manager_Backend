class Tank < ApplicationRecord
    # validates :name, uniqueness: { case_sensitive: false, message: "Tank with this name already exists." }
    validate :tank_name_unique_to_owner, on: :create
    belongs_to :section
    has_many :lot_tanks
    has_many :lots, through: :lot_tanks

    def tank_name_unique_to_owner
        # byebug
        section.owner.tanks.each do |tank|
            if tank.name == name
                errors.add(:message, "Tank with this name already exists" )
            end
        end
    end
end
