require 'rails_helper'

RSpec.feature 'MoviesOverview', type: :feature do
  let!(:director1) { create(:director, name: 'Christopher Nolan') }
  let!(:director2) { create(:director, name: 'The Wachowskis') }

  let!(:movie1) { create(:movie, title: 'Inception', description: 'desc 1', year: 2010, director: director1) }
  let!(:movie2) { create(:movie, title: 'The Matrix', description: 'desc 2', year: 1999, director: director2) }

  let!(:user1) { create(:user, name: 'John Doe') }
  let!(:user2) { create(:user, name: 'Jane Smith') }

  let!(:review1) { create(:review, movie: movie1, user: user1, stars: 5, review: 'Excellent movie!') }
  let!(:review2) { create(:review, movie: movie1, user: user2, stars: 4, review: 'Very good!') }
  let!(:review3) { create(:review, movie: movie2, user: user1, stars: 3, review: 'Good, but not great.') }

  scenario 'User views an overview of all movies with average ratings' do
    visit movies_path

    expect(page).to have_content('Movies Overview')
    expect(page).to have_content('Inception')
    expect(page).to have_content('The Matrix')
    expect(page).to have_content('desc 1')
    expect(page).to have_content('desc 2')
    expect(page).to have_content('2010')
    expect(page).to have_content('1999')
    expect(page).to have_content('Christopher Nolan')
    expect(page).to have_content('The Wachowskis')
    expect(page).to have_content('4.5') # Average rating for Inception
    expect(page).to have_content('3.0') # Average rating for The Matrix
  end
end
