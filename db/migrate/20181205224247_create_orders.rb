class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :transaction_id
      t.integer :order_no
      t.string :status
      t.timestamps
    end
  end
end
