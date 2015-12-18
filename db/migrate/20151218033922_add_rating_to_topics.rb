class AddRatingToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :rating, index: true
    add_foreign_key :topics, :ratings
  end
end
