class EditColumnsUserTable < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :google_refresh_token, :string
    remove_column :users, :google_refresh_toknn
  end
end
