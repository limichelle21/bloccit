class AddRatingToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :rating, :integer, index: true
    add_foreign_key :posts, :ratings
  end
end
