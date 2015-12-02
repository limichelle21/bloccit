require 'rails_helper'

RSpec.describe Post, type: :model do
	let(:post) {Post.create!(title: "New Post Title", body: "New Post Body")}

	describe "attributes" do
		it "should respond to title" do
			expect(post).to respond_to(:title)
		end

		it "should respond to body" do
			expect(post).to respond_to(:body)
		end
	end

	describe "#spam" do
		it "replaces the first title with spam" do
			Post.create(title: "First Title", body: "First body")
			title = post.title.first.spam
			expect(title).to eq("SPAM")
		end
	end
  
end
