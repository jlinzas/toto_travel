class Order < ApplicationRecord
  belongs_to :user
  belongs_to :spaceship

  validates :start_date, :end_date, presence: true
end
