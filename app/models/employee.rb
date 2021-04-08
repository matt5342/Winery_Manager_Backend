class Employee < ApplicationRecord
    belongs_to :owner
    has_many :wineries, through: :owner
end
