class ChangeColumnNullToProduct < ActiveRecord::Migration[5.2]
  def change
    def up
      change_column_null :products, :name, true
    end

    def down
      change_column_null :products, :name, false
    end
  end
end
