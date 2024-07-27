FactoryBot.define do
  factory :movie_location do
    movie { create(:movie) }
    location { create(:location) }
  end
end
