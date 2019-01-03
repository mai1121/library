Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :posts
  resources :users, only: %i[show index]
  root 'users#index'
end
