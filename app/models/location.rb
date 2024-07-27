class Location < ApplicationRecord
  belongs_to :country
  has_many :movie_locations
  has_many :movies, through: :movie_locations
end
