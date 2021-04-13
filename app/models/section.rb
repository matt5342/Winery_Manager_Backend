class Section < ApplicationRecord
    belongs_to :owner
    has_many :employees, through: :owner
    has_many :inventories
    has_many :actions
    has_many :lots
    has_many :tanks
end
