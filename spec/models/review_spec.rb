require 'rails_helper'

RSpec.describe Review, type: :model do
  it 'has a valid factory' do
    expect(build(:review)).to be_valid
  end

  describe 'ActiveRecord associations' do
    it { should belong_to(:movie) }
  end

  describe 'ActiveModel validations' do
    it { should validate_presence_of(:stars) }
  end
end
