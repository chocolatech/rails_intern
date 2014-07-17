Rails.application.routes.draw do
 
  devise_for :users
  root 'home#index'
  resources :posts
  resources :comments
  resources :authors
  resources :users, only: [:show]

end
