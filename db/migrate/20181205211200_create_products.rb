class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.string :color
      t.string :material
      t.string :image_front
      t.string :image_back
      t.string :image_left
      t.string :image_right
      t.string :price
      t.string :brand
      t.string :size
      t.references :user, foreign_key: true
    end
  end
end
