class CreateIndexes < ActiveRecord::Migration[7.1]
  def change
    # Add indexes for faster import data and search
    add_index :movies, :title
    add_index :directors, :name
    add_index :actors, :name
    add_index :locations, :name
    add_index :countries, :name
    add_index :users, :name
    add_index :reviews, :stars
  end
end
