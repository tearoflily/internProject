class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null:false
      t.integer :price, null:false
      t.text :process
      t.datetime :seles_date, null:false
      t.integer :stock, null:false, default: 0

      t.timestamps
    end
  end
end
