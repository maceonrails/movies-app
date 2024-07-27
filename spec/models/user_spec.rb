require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has a valid factory' do
    expect(build(:user)).to be_valid
  end

  describe 'ActiveRecord associations' do
    it { should have_many(:reviews) }
  end

  describe 'ActiveModel validations' do
    it { should validate_presence_of(:name) }
  end
end
