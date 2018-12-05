class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.integer :transaction_id
      t.string :amount
      t.string :pay_method
      t.string :payment_status
      t.user :references
    end
  end
end
