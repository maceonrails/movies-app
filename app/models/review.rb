class Review < ApplicationRecord
  belongs_to :movie
  belongs_to :user

  validates :movie_id, :user_id, :stars, presence: true
end
