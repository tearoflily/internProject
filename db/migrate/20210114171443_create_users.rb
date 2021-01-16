class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :name_kana, null: false
      t.string :tellnumber
      t.string :email, null:false
      t.boolean :employee, null:false

      t.timestamps
    end
  end
end
