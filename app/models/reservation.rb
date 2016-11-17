class Reservation < ApplicationRecord
  include DateValidatable

  belongs_to :item
  belongs_to :user
  validates :start_on, presence: true
  validates :end_on, presence: true
  validate :start_on_cannot_be_in_the_past
  validate :end_on_cannot_be_less_than_start_on
  validates :item, presence: true
  validates :user, presence: true
  #validates :user_rating, numericality: { in: 0..5 }
  #validates :owner_rating, numericality: { in: 0..5 }
end
