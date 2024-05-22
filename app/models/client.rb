class Client < ApplicationRecord
  belongs_to :user
  has_many :directions
  has_many :identifications


  validates :client_email, presence: true
  validates :first_name, presence: true 
  validates :last_name, presence: true 
  validates :tel_number, presence: true 
end
