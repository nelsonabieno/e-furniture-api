class ShippingDetail < ApplicationRecord
  belongs_to :user
  validates_presence_of :recipient_name
  validates_presence_of :recipient_address
  validates_presence_of :order_no
  validates_presence_of :lg_id
  validates_presence_of :state_id
  validates_presence_of :phone_no
  validates_presence_of :city
  validates_presence_of :user_id
end
