class CreateCameras < ActiveRecord::Migration[5.1]
  def change
    create_table :cameras do |t|
      t.string :brand
      t.string :model
      t.text :description
      t.string :condition
      t.string :title
      t.string :color
      t.decimal :price, precision: 10, scale: 2, default: 0

      t.timestamps
    end
  end
end
