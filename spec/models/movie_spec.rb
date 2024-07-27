require 'rails_helper'

RSpec.describe Movie, type: :model do
  it 'has a valid factory' do
    expect(build(:movie)).to be_valid
  end

  describe 'ActiveRecord associations' do
    it { should belong_to(:director)}
    it { should have_many(:reviews).dependent(:destroy) }
    it { should have_many(:movie_actors).dependent(:destroy) }
    it { should have_many(:actors).through(:movie_actors) }
    it { should have_many(:movie_locations).dependent(:destroy) }
    it { should have_many(:locations).through(:movie_locations) }
  end

  describe 'ActiveModel validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:year) }
  end

  describe 'search_by_actor scope' do
    let!(:movie1) { create(:movie) }
    let!(:movie2) { create(:movie) }
    let!(:actor1) { create(:actor, name: 'John Doe') }
    let!(:actor2) { create(:actor, name: 'Jane Smith') }
    let!(:movie_actor1) { create(:movie_actor, movie: movie1, actor: actor1) }
    let!(:movie_actor2) { create(:movie_actor, movie: movie2, actor: actor2) }

    it 'returns movies with matching actor name' do
      expect(Movie.search_by_actor('John')).to include(movie1)
    end

    it 'does not return movies without matching actor name' do
      expect(Movie.search_by_actor('John')).not_to include(movie2)
    end

    it 'returns distinct movies' do
      expect(Movie.search_by_actor('John').count).to eq(1)
    end

    it 'returns all movies when query is blank' do
      expect(Movie.search_by_actor('')).to include(movie1, movie2)
    end
  end

  describe '#update_avg_stars' do
    let!(:movie) { create(:movie) }
    let!(:review1) { create(:review, movie: movie, stars: 4) }
    let!(:review2) { create(:review, movie: movie, stars: 5) }

    it 'updates the average_rating attribute' do
      movie.update_avg_stars
      expect(movie.average_rating).to eq(4.5)
    end
  end
end