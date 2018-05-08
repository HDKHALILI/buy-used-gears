class ChangeNumericFieldInMyTable < ActiveRecord::Migration[5.1]
  def change
    change_column :cameras, :price, :decimal, precision: 19, scale: 4
  end
end
