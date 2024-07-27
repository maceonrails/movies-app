class MovieLocation < ApplicationRecord
  belongs_to :movie
  belongs_to :location

  validates :movie_id, :location_id, presence: true
end
