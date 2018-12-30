class User < ApplicationRecord
  has_secure_password
  belongs_to :role
  has_many :products, dependent: :delete_all
  has_many :shipping_details, dependent: :delete_all
  has_many :addresses, dependent: :delete_all
  validates :first_name, presence:true
  validates :last_name, presence:true
  validates :phone_no, presence:true
  validates :email, presence:true

end
