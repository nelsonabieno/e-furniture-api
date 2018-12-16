class Product < ApplicationRecord
  belongs_to :user
  validates :name, presence:true
  validates :description, presence:true
  validates :color, presence:true
  validates :material, presence:true
  validates :image_front, presence:true
  validates :image_back, presence:true
  validates :image_left, presence:true
  validates :image_right, presence:true
  validates :price, presence:true
  validates :brand, presence:true
  validates :size, presence:true
end