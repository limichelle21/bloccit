module UsersHelper

	def posts?
		@user.posts.empty?
	end

	def comments?
		@user.comments.empty?
	end
end
