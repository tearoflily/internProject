class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :name, null:false
      t.integer :price, null:false
      t.string :process
      t.integer :num, null:false
      t.integer :status, null:false, default: 1
      t.datetime :order_time, null:false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
