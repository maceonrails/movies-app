class Review < ApplicationRecord
  belongs_to :movie
  belongs_to :user

  validates :movie_id, :user_id, :stars, presence: true

  after_save :update_movie_avg_stars

  private

  def update_movie_avg_stars
    movie.update_avg_stars
  end
end
