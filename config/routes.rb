Rails.application.routes.draw do

  devise_for :users
  root "home#index"
  resources :comments
  resources :games
  resources :posts
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
