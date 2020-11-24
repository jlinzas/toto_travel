class CreateSpaceships < ActiveRecord::Migration[6.0]
  def change
    create_table :spaceships do |t|
      t.string :name
      t.text :description
      t.integer :number_of_seats
      t.string :speed
      t.integer :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
