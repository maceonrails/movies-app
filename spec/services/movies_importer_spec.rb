require 'rails_helper'
require 'csv'

RSpec.describe MoviesImporter, type: :service do
  let(:movies_csv) do
    <<~CSV
      Movie,Description,Year,Director,Actor,Filming location,Country
      Inception,A thief who steals corporate secrets through the use of dream-sharing technology.,2010,Christopher Nolan,Leonardo DiCaprio,Paris,France
      The Matrix,A computer hacker learns about the true nature of his reality.,1999,The Wachowskis,Keanu Reeves,Sydney,Australia
    CSV
  end

  let(:reviews_csv) do
    <<~CSV
      Movie,User,Stars,Review
      Inception,John Doe,5,Excellent movie!
      The Matrix,Jane Smith,4,Great concept and execution!
    CSV
  end

  let(:movies_file_path) { Rails.root.join('tmp', 'movies.csv') }
  let(:reviews_file_path) { Rails.root.join('tmp', 'reviews.csv') }

  before do
    File.write(movies_file_path, movies_csv)
    File.write(reviews_file_path, reviews_csv)
  end

  after do
    File.delete(movies_file_path) if File.exist?(movies_file_path)
    File.delete(reviews_file_path) if File.exist?(reviews_file_path)
  end

  describe '#import' do
    subject { described_class.new(movies_file_path, reviews_file_path) }

    it 'imports movies, directors, actors, locations, and reviews correctly' do
      expect { subject.import }.to change { Movie.count }.by(2)
        .and change { Director.count }.by(2)
        .and change { Actor.count }.by(2)
        .and change { Location.count }.by(2)
        .and change { Country.count }.by(2)
        .and change { Review.count }.by(2)
        .and change { User.count }.by(2)

      movie = Movie.find_by(title: 'Inception')
      expect(movie.description).to eq('A thief who steals corporate secrets through the use of dream-sharing technology.')
      expect(movie.year).to eq(2010)
      expect(movie.directors.pluck(:name)).to include('Christopher Nolan')
      expect(movie.actors.pluck(:name)).to include('Leonardo DiCaprio')
      expect(movie.locations.pluck(:name)).to include('Paris')

      review = Review.find_by(movie: movie)
      expect(review.stars).to eq(5)
      expect(review.review).to eq('Excellent movie!')
      expect(review.user.name).to eq('John Doe')
    end
  end
end
