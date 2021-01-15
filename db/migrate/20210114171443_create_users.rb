class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :name_kana
      t.string :tellnumber
      t.string :email
      t.boolean :employee

      t.timestamps
    end
  end
end
