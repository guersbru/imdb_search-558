class Movie < ApplicationRecord
  belongs_to :director, optional: true

  searchkick

  include PgSearch::Model
  pg_search_scope :search_by_title_and_synopsis,
    against: [ :title, :synopsis ],
    associated_against: {
      director: [ :first_name, :last_name ]
    },
    using: {
      tsearch: { prefix: true }
    }

  multisearchable against: [:title, :synopsis]
end
