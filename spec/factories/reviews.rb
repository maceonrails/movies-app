FactoryBot.define do
  factory :review do
    movie { create(:movie) }
    user { create(:user) }
    stars { 1 }
    review { "MyText" }
  end
end
