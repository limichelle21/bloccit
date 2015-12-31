require 'rails_helper'

RSpec.describe UsersController, type: :controller do

	let (:new_user_attributes) do 
		{ 
			name: "BlocHead",
			email: "blochead@bloc.io",
			password: "blochead",
			password_confirmation: "blochead"
		}
	end

	describe "GET new" do
		it "returns http success" do
			get :new 
			expect(response).to have_http_status(:success)
		end

		it "instantiates a new user" do
			get :new
			expect(:user).to_not be_nil
		end
	end

	describe "POST create" do
		it "returns an http redirect" do
			post :create, user: new_user_attributes
			expect(response).to have_http_status(:redirect)
		end

		it "creates a new user" do
			expect {post :create, user: new_user_attributes}.to change(User, :count).by(1)
		end

		it "sets user name properly" do
			post :create, user: new_user_attributes
			expect(assigns(:user).name).to eq new_user_attributes[:name]
		end

		it "sets user email properly" do
			post :create, user: new_user_attributes
			expect(assigns(:user).email).to eq new_user_attributes[:email]
		end


		it "sets user password properly" do
			post :create, user: new_user_attributes
			expect(assigns(:user).password).to eq new_user_attributes[:password]
		end

		it "sets user password_confirmation properly" do
			post :create, user: new_user_attributes
			expect(assigns(:user).password_confirmation).to eq new_user_attributes[:password_confirmation]
		end

		it "logs the user in after sign up" do
			post :create, user: new_user_attributes
			expect(session[:user_id]).to eq assigns(:user).id
		end

	end

	describe "not signed in" do 
		let(:factory_user) { create(:user) }

		before do 
			post :create, user: new_user_attributes
		end

		it "returns http success" do 
			get :show, {id: factory_user.id} 
			expect(response).to have_http_status(:success)
		end

		it "renders the #show view" do 
			get :show, {id: factory_user.id}
			expect(response).to render_template :show
		end

		it "assigns the factory_user to @user" do 
			get :show, {id: factory_user.id}
			expect(assigns(:user)).to eq(factory_user)
		end

		it "returns favorited posts by the current user" do
			2.times do
				factory_user.favorites.create(post_id: 1)
			end
			get :show, {id: factory_user.id}
			expect(assigns(:favorites).count).to eq(2)
	
		end	

		#it "returns the proper Gravatar URL for the post's user" do 
		#	user = post.user
		#	expected_gravatar = 
		#end

		# it "returns the correct number of votes for the favorited post" do 
		# 	vote = Vote.create(value: 1)
		# 	vote = post.favorite.vote.count
		# 	expect(vote.count).to eq(1)
		# end

		# it "returns the correct number of comments for the favorited post" do 
		# 	comment = Comment.create(body: "comment")
		# 	expect(comments.count).to eq(1)
		# end


	end



end
