class AddCategoryAndProductIndexesToProductCategory < ActiveRecord::Migration[5.1]
  def change
    add_reference :product_categories, :product,  foreign_key: true
    add_reference :product_categories, :category, foreign_key: true
  end
end
