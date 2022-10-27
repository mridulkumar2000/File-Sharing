class User < ApplicationRecord
    has_secure_password
    has_many :documents
    validates :user_name, :full_name, :email, presence: true
    validates :user_name, length: { maximum: 15 }, uniqueness: true
    validates :password, presence: true, length: { minimum: 8, maximum: 15 },format: { 
        with: /(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).*/, 
        message:  "Password must contain atleast one uppercase, lowercase and number" 
    }, on: :create
end
