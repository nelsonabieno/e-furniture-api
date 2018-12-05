class CreateShippingDetail < ActiveRecord::Migration[5.1]
  def change
    create_table :shipping_details do |t|
      t.string :recipient_name
      t.string :recipient_address
      t.string :order_no
      t.integer :lg_id
      t.integer :state_id
      t.string :phone_no
      t.string :city
      t.references :user, foreign_key: true
    end
  end
end
