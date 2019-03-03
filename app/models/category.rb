class Category < ApplicationRecord
  has_many :product_categories, dependent: :delete_all
  has_many :products,through: :product_categories, dependent: :delete_all
  validates_presence_of :name
end