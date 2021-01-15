class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :path
      t.string :name, null:false
      t.string :category, null:false
      t.string :info

      t.timestamps
    end
  end
end
