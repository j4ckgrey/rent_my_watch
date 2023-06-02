class Watch < ApplicationRecord
  has_many_attached :photos
  has_many :rentals, dependent: :destroy
  belongs_to :user

  include PgSearch::Model
  pg_search_scope :watch_search,
    against: %i[name brand model],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
