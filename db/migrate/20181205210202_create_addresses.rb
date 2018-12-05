class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :street_address
      t.string :lga
      t.string :city
      t.string :state
      t.references :user, foreign_key: true
    end
  end
end
