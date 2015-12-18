require 'rails_helper'
include RandomData

RSpec.describe Rating, type: :model do
   
   it { should have_many :posts }
   it { should have_many :topics }

   describe ".update_rating" do
   	it "should create a non-existent rating" do
   		expect(Rating.update_rating("PG")).to_not be_nil
   	end
   end  
end

