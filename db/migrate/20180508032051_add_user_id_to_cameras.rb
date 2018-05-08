class AddUserIdToCameras < ActiveRecord::Migration[5.1]
  def change
    add_column :cameras, :user_id, :integer
  end
end
