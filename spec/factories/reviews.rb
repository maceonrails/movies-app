FactoryBot.define do
  factory :review do
    movie { nil }
    user { nil }
    stars { 1 }
    review { "MyText" }
  end
end
