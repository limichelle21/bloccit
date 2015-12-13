module TopicsHelper	

	def user_is_authorized_admin_topics?
		current_user && current_user.admin?
	end

	def user_is_authorized_mod_topics?
		current_user && (current_user.admin? || current_user.moderator?)
	end


end
