class Client < ApplicationRecord
    belongs_to :user, class_name: "user", foreign_key: "user_id"

    validates :email, presence: true, 
    uniqueness: true
    validates :first_name, presence: true 
    validates :last_name, presence: true 
    validates :tel_number, presence: true 
end
