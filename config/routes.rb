Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :users
  resources :friendships
  resources :friend_requests
  
  get '/profile', to: 'users#profile'
  get '/profile/friend_requests', to: 'friend_requests#index'
end
