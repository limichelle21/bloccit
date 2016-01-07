class AddRatingIdToPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :rating_id, :integer, index: true
    # add_foreign_key :posts, :ratings
  end
end
