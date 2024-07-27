class Movie < ApplicationRecord
  has_many :reviews
  has_many :movie_directors
  has_many :directors, through: :movie_directors
  has_many :movie_actors
  has_many :actors, through: :movie_actors
  has_many :movie_locations
  has_many :locations, through: :movie_locations
end
