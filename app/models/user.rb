class User < ApplicationRecord
    has_secure_password
    has_many :clients

    validates :email, presence: true, 
    uniqueness: true
    validates :password, presence: true
    normalizes :email, with: ->(email) {email.strip.downcase};
end
