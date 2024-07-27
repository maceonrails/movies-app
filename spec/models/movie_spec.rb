require 'rails_helper'

RSpec.describe Movie, type: :model do
  it 'has a valid factory' do
    expect(build(:movie)).to be_valid
  end

  describe 'ActiveRecord associations' do
    it { should have_many(:reviews) }
    it { should have_many(:movie_directors) }
    it { should have_many(:directors).through(:movie_directors) }
    it { should have_many(:movie_actors) }
    it { should have_many(:actors).through(:movie_actors) }
    it { should have_many(:movie_locations) }
    it { should have_many(:locations).through(:movie_locations) }
  end

  describe 'ActiveModel validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:year) }
  end
end
