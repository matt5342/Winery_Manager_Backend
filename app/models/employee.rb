class Employee < ApplicationRecord
    belongs_to :owner
    has_many :sections, through: :owner
end
