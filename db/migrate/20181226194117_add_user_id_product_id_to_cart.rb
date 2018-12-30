class AddUserIdProductIdToCart < ActiveRecord::Migration[5.1]
  def change
    add_reference :carts, :users, foreign_key:true
    add_reference :carts, :products, foreign_key:true
    remove_column :carts, :string
  end
end
