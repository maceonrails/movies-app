require 'rails_helper'

RSpec.describe Country, type: :model do
  it 'has a valid factory' do
    expect(build(:country)).to be_valid
  end

  describe 'ActiveRecord associations' do
    it { should have_many(:locations) }
  end

  describe 'ActiveModel validations' do
    it { should validate_presence_of(:name) }
  end
end
