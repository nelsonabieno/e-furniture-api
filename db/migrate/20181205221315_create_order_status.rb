class CreateOrderStatus < ActiveRecord::Migration[5.1]
  def change
    create_table :order_statuses do |t|
      t.string :status
    end
  end
end
