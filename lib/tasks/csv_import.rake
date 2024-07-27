# frozen_string_literal: true

namespace :csv do
  desc 'Import movies and reviews from CSV files'
  task import: :environment do
    movies_file_path = ENV['MOVIES_FILE_PATH'] || 'db/data/movies.csv'
    reviews_file_path = ENV['REVIEWS_FILE_PATH'] || 'db/data/reviews.csv'

    MoviesImportJob.perform_later(movies_file_path, reviews_file_path)
    puts 'CSV import job has been enqueued.'
  end
end
