require 'rails_helper'
include RandomAd

RSpec.describe AdvertisementsController, type: :controller do

let(:my_ad) { Advertisement.create(title: RandomAd.random_sentence, copy: RandomAd.random_paragraph, price: 5)}

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns [my_ad] to @advertisements" do 
      get :index
      expect(assigns(:posts)).to eq([my_ad)])
    end
  end

  describe "GET show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
        it "renders the #show view" do
      get :show, {id: my_ad.id}
      expect(response).to render_template :show
    end

    it "assigns my_ad to @advertisement" do
      get :show, {id: my_ad.id}
      expect(assigns(:post)).to eq(my_ad)
    end

  end

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
    it "renders the #new view" do
      # does get :new mean access the new method using a get request?
      get :new
      expect(response).to render_template :new
    end

    it "instantiates @advertisement" do
      get :new
      expect(assigns(:post)).not_to be_nil
    end
  end

  #describe "GET #create" do
   # it "returns http success" do
    #  get :create
     # expect(response).to have_http_status(:success)
    #end
  #end

  describe "POST create" do
    it "increases the number of Advertisement by 1" do
      expect{post :create, post: {title: RandomAd.random_sentence, copy: RandomAD.random_paragraph, price: 5}}.to change(Advertisement, :count).by(1)
    end

    it "assigns the new advertisement to @advertisement" do
      post :create, post: {title: RandomAd.random_sentence, copy: RandomAd.random_paragraph, price: 5}
      expect(assigns(:post)).to eq Advertisement.last
    end

    it "redirects to the new advertisement" do
      post :create, post: {title: RandomAd.random_sentence, copy: RandomAd.random_paragraph, price: 5}
      expect(response).to redirect_to Advertisement.last
    end
  end


end
