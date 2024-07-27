FactoryBot.define do
  factory :movie_actor do
    movie { create(:movie) }
    actor { create(:actor) }
  end
end
