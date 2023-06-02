class Watch < ApplicationRecord
  has_many_attached :photos
  has_many :rentals
  belongs_to :user

  include PgSearch::Model
  pg_search_scope :watch_search,
                  against: %i[name brand model],
                  using: {
                    tsearch: { prefix: true }
                  }
end
