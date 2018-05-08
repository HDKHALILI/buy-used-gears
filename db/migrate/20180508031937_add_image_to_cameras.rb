class AddImageToCameras < ActiveRecord::Migration[5.1]
  def change
    add_column :cameras, :image, :string
  end
end
