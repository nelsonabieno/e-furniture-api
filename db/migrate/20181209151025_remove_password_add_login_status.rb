class RemovePasswordAddLoginStatus < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :password
    add_column :users, :login_status, :boolean
  end
end
