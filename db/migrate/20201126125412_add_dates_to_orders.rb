class AddDatesToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :start_date, :string
    add_column :orders, :end_date, :string
  end
end
