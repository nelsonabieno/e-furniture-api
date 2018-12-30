class Payment < ApplicationRecord
  validates :trans_id, presence:true
  validates :amount, presence:true
  validates :payment_method, presence:true
  validates :user_id, presence:true
  validates :payment_status, presence:true
end
