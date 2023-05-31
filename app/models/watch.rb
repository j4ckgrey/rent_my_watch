class Watch < ApplicationRecord
  has_many_attached :photos
  has_many :rentals
  belongs_to :user
end
