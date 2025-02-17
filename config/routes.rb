Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
			resources :comments, only: [:create, :destroy]
			resources :likes, only: [:create]
		end
  end

  root "users#index"
end
