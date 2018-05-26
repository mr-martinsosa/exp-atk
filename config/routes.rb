Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  get 'users/edit'
  get 'users/destroy'
  get 'users/update'
  get 'users/create'
  get 'users/new'
  get 'posts/index'
  get 'posts/show'
  get 'posts/edit'
  get 'posts/destroy'
  get 'posts/update'
  get 'posts/create'
  get 'posts/new'
  get 'games/index'
  get 'games/show'
  get 'games/edit'
  get 'games/destroy'
  get 'games/update'
  get 'games/create'
  get 'games/new'
  get 'comments/index'
  get 'comments/show'
  get 'comments/edit'
  get 'comments/destroy'
  get 'comments/update'
  get 'comments/create'
  get 'comments/new'
  root to: 'home#index'
  resources :comments
  resources :games
  resources :posts
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
