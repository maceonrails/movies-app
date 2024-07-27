require 'rails_helper'

RSpec.describe Director, type: :model do
  it 'has a valid factory' do
    expect(build(:director)).to be_valid
  end

  describe 'ActiveRecord associations' do
    it { should have_many(:movie_directors) }
    it { should have_many(:movies).through(:movie_directors) }
  end

  describe 'ActiveModel validations' do
    it { should validate_presence_of(:name) }
  end
end
