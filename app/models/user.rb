class User < ActiveRecord::Base
	before_save { self.email = email.downcase}

	before_save :name_format


	EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i 

	validates :name, length: { minimum: 1, maximum: 100}, presence: true

	validates :password, presence: true, length: { minimum: 6}, if: "password_digest.nil?"
	validates :password, length: { minimum: 6}, allow_blank: true

	validates :email,
			presence: true,
			uniqueness: { case_sensitive: false },
			length: { minimum: 3, maximum: 100 },
			format: { with: EMAIL_REGEX }

	has_secure_password


	def name_format
		full_name = []
		name1 = name.split(" ")
		name1.each do |n| 
			full_name << n.capitalize
		end
		self.name = full_name.join(" ")
	end

end
