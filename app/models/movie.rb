class Movie < ApplicationRecord
  belongs_to :director
  has_many :reviews, dependent: :destroy
  has_many :movie_actors, dependent: :destroy
  has_many :actors, through: :movie_actors
  has_many :movie_locations, dependent: :destroy
  has_many :locations, through: :movie_locations

  validates :title, presence: true
  validates :year, presence: true

  scope :search_by_actor, -> (query) {
    joins(:actors).where('actors.name ILIKE ?', "%#{query}%").distinct if query.present?
  }

  def update_avg_stars
    update(average_rating: reviews.average(:stars).to_f.round(2))
  end
end
