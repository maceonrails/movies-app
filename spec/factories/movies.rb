FactoryBot.define do
  factory :movie do
    director { create(:director) }
    title { "MyString" }
    description { "MyText" }
    year { 1 }
  end
end
