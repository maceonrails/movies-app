class MovieActor < ApplicationRecord
  belongs_to :movie
  belongs_to :actor

  validates :movie_id, :actor_id, presence: true
end
