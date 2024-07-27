FactoryBot.define do
  factory :location do
    name { "MyString" }
    country { create(:country) }
  end
end
