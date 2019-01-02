class ModifyProductsUsersAndAddCartNoToCartTable < ActiveRecord::Migration[5.1]
  def change
    rename_column :carts, :users_id, :user_id
    rename_column :carts, :products_id, :product_id
    add_column :carts, :cart_no, :integer
  end
end
