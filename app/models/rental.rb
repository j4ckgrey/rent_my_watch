class Rental < ApplicationRecord
  belongs_to :watch

  validates :start_date, presence: true
  validates :end_date, presence: true
end
