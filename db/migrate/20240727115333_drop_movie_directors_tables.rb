class DropMovieDirectorsTables < ActiveRecord::Migration[7.1]
  def change
    drop_table :movie_directors do |t|
      t.references :movie, null: false, foreign_key: true
      t.references :director, null: false, foreign_key: true

      t.timestamps null: false
    end
  end
end
