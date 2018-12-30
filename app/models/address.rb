class Address < ApplicationRecord
  belongs_to :user
  validates_presence_of :street_address
  validates_presence_of :lga
  validates_presence_of :city
  validates_presence_of :state
end
