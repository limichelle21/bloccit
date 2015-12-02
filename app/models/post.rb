class Post < ActiveRecord::Base
	has_many :comments

	def self.spam
		Post.all.each_with_index do | post, index |
			if index % 5 == 0
				post.update_attribute(:title, "SPAM")
			end
		end	
	end


end
