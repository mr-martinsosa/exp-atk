Rails.application.routes.draw do

  # devise_for :users
  devise_for :users, :controllers => { :registrations => "users/registrations" }
  root "home#index"
  resources :comments
  resources :games
  resources :posts
  resources :users

  get "/games/show/:name" => "games#show", as: "show_game"
  get "/games/results" => "games#result", as: "game_result"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
