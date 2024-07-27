class MoviesController < ApplicationController
  def index
    @movies = Movie.with_average_ratings
  end
end
