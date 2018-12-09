class User < ApplicationRecord
  has_secure_password
  belongs_to :role
  validates :first_name, presence:true
  validates :last_name, presence:true
  validates :phone_no, presence:true
  validates :email, presence:true

end
