require 'rails_helper'

RSpec.feature "MoviesSearch", type: :feature do
  let!(:movie1) { create(:movie, title: 'Inception', description: 'A thief who steals corporate secrets through the use of dream-sharing technology.', year: 2010) }
  let!(:movie2) { create(:movie, title: 'The Matrix', description: 'A computer hacker learns about the true nature of his reality.', year: 1999) }

  let!(:actor1) { create(:actor, name: 'Leonardo DiCaprio') }
  let!(:actor2) { create(:actor, name: 'Joseph Gordon-Levitt') }
  let!(:actor3) { create(:actor, name: 'Keanu Reeves') }
  let!(:actor4) { create(:actor, name: 'Laurence Fishburne') }

  before do
    create(:movie_actor, movie: movie1, actor: actor1)
    create(:movie_actor, movie: movie1, actor: actor2)
    create(:movie_actor, movie: movie2, actor: actor3)
    create(:movie_actor, movie: movie2, actor: actor4)
  end

  scenario "User searches for an actor and sees the relevant movies" do
    visit root_path

    fill_in "Search for an actor", with: "Leonardo DiCaprio"
    click_button "Search"

    expect(page).to have_content('Inception')
    expect(page).not_to have_content('The Matrix')
  end

  scenario "User searches for an actor with no results" do
    visit root_path

    fill_in "Search for an actor", with: "Tom Cruise"
    click_button "Search"

    expect(page).to have_content('Movies Overview')
    expect(page).not_to have_content('Inception')
    expect(page).not_to have_content('The Matrix')
  end
end
