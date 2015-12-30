include RandomData

FactoryGirl.define do 
	factory :vote do 
		value RandomData.random_num
		post
		user
	end
end
