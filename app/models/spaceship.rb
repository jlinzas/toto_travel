class Spaceship < ApplicationRecord
  belongs_to :user
  has_many :orders, dependent: :destroy
  has_one_attached :photo
  validates :name, :number_of_seats, :speed, :price, presence: true
end
