require 'rails_helper'

RSpec.describe Location, type: :model do
  it 'has a valid factory' do
    expect(build(:location)).to be_valid
  end

  describe 'ActiveRecord associations' do
    it { should have_many(:movie_locations) }
    it { should have_many(:movies).through(:movie_locations) }
    it { should belong_to(:country) }
  end

  describe 'ActiveModel validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:country_id) }
  end
end
