class Owner < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false, message: "Username already in use! Please choose a different username" }
    # validates :email, uniqueness: { case_sensitive: false, "Email already in use. Please choose a different email" } 
end
