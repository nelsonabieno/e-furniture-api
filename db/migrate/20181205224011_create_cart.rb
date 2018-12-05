class CreateCart < ActiveRecord::Migration[5.1]
  def change
    create_table :carts do |t|
      t.integer :transaction_id
      t.integer :qty
      t.string :price
      t.string :total_amount
      t.string :string
    end
  end
end
