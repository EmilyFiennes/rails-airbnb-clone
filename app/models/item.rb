class Item < ApplicationRecord
  belongs_to :user
  has_many :availabilities
  has_many :reservations
end
