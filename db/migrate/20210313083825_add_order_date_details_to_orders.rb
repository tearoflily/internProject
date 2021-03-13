class AddOrderDateDetailsToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :order_date_details, :datetime, null: false
  end
end
