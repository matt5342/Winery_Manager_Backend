class Owner < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false, message: "Username already in use! Please choose a different username" }
    validates :email, uniqueness: { case_sensitive: false, message: "Email already in use. Please choose a different email" } 
    has_many :sections
    has_many :tanks, through: :sections
    has_many :employees
    has_many :lots
    has_many :work_orders, through: :lots
end
