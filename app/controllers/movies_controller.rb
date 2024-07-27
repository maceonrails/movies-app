class MoviesController < ApplicationController
  def index
    @movies = Movie.search_by_actor(params[:query])
                   .includes(:director, :actors)
                   .order(:average_rating)
  end
end
