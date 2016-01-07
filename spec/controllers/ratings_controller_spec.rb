require 'rails_helper'

RSpec.describe RatingsController, type: :controller do

	let (:rating) {Rating.update_rating(1)}

	describe "GET #show" do
		it "returns http success" do
		  get :show, id: rating.id
		  expect(response).to have_http_status(:success)
		end
	end

end
