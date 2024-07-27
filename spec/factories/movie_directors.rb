FactoryBot.define do
  factory :movie_director do
    movie { create(:movie) }
    director { create(:director) }
  end
end
