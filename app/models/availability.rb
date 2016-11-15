class Availability < ApplicationRecord
  include DateValidatable

  belongs_to :item
  validates :item, presence: true
  validates :start_on, presence: true
  validates :end_on, presence: true
  validate :start_on_cannot_be_in_the_past
  validate :end_on_cannot_be_less_than_start_on
end
