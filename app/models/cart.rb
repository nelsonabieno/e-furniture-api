class Cart < ApplicationRecord
  has_many :products
  belongs_to :user

  validates :transaction_id, presence:true
  validates :product_id, presence:true
  validates :qty, presence:true
  validates :price, presence:true
  validates :total_amount, presence:true
  validates :user_id, presence:true
  validates :cart_no, presence:true
end
