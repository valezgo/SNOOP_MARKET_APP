class Item < ApplicationRecord
  belongs_to :category
  has_one_attached :photo

  include PgSearch::Model
  pg_search_scope :global_search,
  against: [ :name, :description],
  associated_against: {
    category: [ :name, :description ]
  },
  using: {
    tsearch: { prefix: true }
  }
end
