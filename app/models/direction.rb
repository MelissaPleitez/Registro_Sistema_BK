class Direction < ApplicationRecord
  belongs_to :client

  validates :street, presence: true
  validates :city, presence: true
  validates :postal_code, presence: true

end
