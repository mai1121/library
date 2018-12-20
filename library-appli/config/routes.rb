Rails.application.routes.draw do
  devise_for :users
  
  resources :users, only: [:show,:index] do
  	resources :posts
  end
  root 'users#index'
end
