class Spaceship < ApplicationRecord
  belongs_to :user
  has_many :orders, dependent: :destroy
  has_one_attached :photo
  validates :name, :number_of_seats, :speed, :price, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_title,
    against: [ :name, :price],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end


    # t.string "name"
    # t.text "description"
    # t.integer "number_of_seats"
    # t.string "speed"
    # t.integer "price"
