require 'rails_helper'

RSpec.describe Actor, type: :model do
  it 'has a valid factory' do
    expect(build(:actor)).to be_valid
  end

  describe 'ActiveRecord associations' do
    it { should have_many(:movie_actors) }
    it { should have_many(:movies).through(:movie_actors) }
  end

  describe 'ActiveModel validations' do
    it { should validate_presence_of(:name) }
  end
end
