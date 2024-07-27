class Movie < ApplicationRecord
  belongs_to :director
  has_many :reviews, dependent: :destroy
  has_many :movie_actors, dependent: :destroy
  has_many :actors, through: :movie_actors
  has_many :movie_locations, dependent: :destroy
  has_many :locations, through: :movie_locations

  validates :title, presence: true
  validates :year, presence: true
end
