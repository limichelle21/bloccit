Rails.application.routes.draw do

  get 'labels/show'

  resources :topics do

	  resources :posts, except: [:index]
	end

	resources :post, only: [] do
		resources :comments, only: [:create, :destroy]
	end

resources :users, only: [:new, :create]

resources :sessions, only: [:new, :create, :destroy]

  get 'about' => 'welcome#about'	
  root to: 'welcome#index'
  
end
