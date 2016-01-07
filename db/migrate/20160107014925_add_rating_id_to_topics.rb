class AddRatingIdToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :rating, :integer, index: true
    add_foreign_key :topics, :ratings
  end
end
