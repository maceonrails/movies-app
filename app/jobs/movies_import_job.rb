class MoviesImportJob < ApplicationJob
  queue_as :default

  def perform(movies_file_path, reviews_file_path)
    importer = MoviesImporter.new(movies_file_path, reviews_file_path)
    importer.import
  end
end
