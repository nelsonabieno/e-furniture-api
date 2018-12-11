class Role < ApplicationRecord
  has_many :users, dependent: :delete_all
  validates_presence_of :name
end
