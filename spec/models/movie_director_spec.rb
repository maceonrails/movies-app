require 'rails_helper'

RSpec.describe MovieDirector, type: :model do
  it 'has a valid factory' do
    expect(build(:movie_director)).to be_valid
  end

  describe 'ActiveRecord associations' do
    it { should belong_to(:movie) }
    it { should belong_to(:director) }
  end

  describe 'ActiveModel validations' do
    it { should validate_presence_of(:movie_id) }
    it { should validate_presence_of(:director_id) }
  end
end
