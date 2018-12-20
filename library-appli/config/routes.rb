Rails.application.routes.draw do
  devise_for :users
  resources :posts
  resources :users, only: [:show,:index] 
  root 'users#index'
end
