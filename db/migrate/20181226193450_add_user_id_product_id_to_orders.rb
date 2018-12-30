class AddUserIdProductIdToOrders < ActiveRecord::Migration[5.1]
  def change
    add_reference :orders, :users, foreign_key:true
    add_reference :orders, :products, foreign_key:true
    add_reference :orders, :order_statuses, foreign_key:true
  end
end
