require 'csv'

class MoviesImporter
  def initialize(movies_file_path, reviews_file_path, batch_size: 1000)
    @movies_file_path = movies_file_path
    @reviews_file_path = reviews_file_path
    @batch_size = batch_size
  end

  def import
    import_movies
    import_reviews
  end

  private

  attr_reader :batch_size, :movies_file_path, :reviews_file_path

  def import_movies
    CSV.foreach(movies_file_path, headers: true).each_slice(batch_size) do |rows|
      rows.each do |row|
        director = save_director(row)
        movie = save_movie(row, director)

        next unless movie

        save_actor(row, movie)
        save_location(row, movie)
      end
    end
  end

  def import_reviews
    CSV.foreach(reviews_file_path, headers: true).each_slice(batch_size) do |rows|
      rows.each do |row|
        movie = Movie.find_by(title: row['Movie'])

        next unless movie

        user = User.find_or_create_by(name: row['User'])
        save_review(row, user, movie)
      end
    end
  end

  def save_movie(row, director)
    Movie.find_or_create_by(title: row['Movie'], director: director) do |m|
      m.description = row['Description']
      m.year = row['Year'].to_i
    end
  end

  def save_director(row)
    return if row['Director'].blank?

    Director.find_or_create_by(name: row['Director'])
  end

  def save_actor(row, movie)
    return if row['Actor'].blank?

    actor = Actor.find_or_create_by(name: row['Actor'])
    MovieActor.find_or_create_by(movie: movie, actor: actor)
  end

  def save_location(row, movie)
    return if row['Filming location'].blank?

    location = Location.find_or_create_by(name: row['Filming location']) do |l|
      l.country = Country.find_or_create_by(name: row['Country'])
    end
    MovieLocation.find_or_create_by(movie: movie, location: location)
  end

  def save_review(row, user, movie)
    Review.find_or_create_by(user: user, movie: movie) do |r|
      r.stars = row['Stars']
      r.review = row['Review']
    end
  end
end
