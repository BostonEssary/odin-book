Rails.application.routes.draw do
  
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "posts#index"

  resources :users
  resources :friendships
  resources :friend_requests
  resources :notifications
  resources :posts do
    resources :comments
    resource :like, only: [:destroy, :create]
  end

  
  get '/profile', to: 'users#profile'
  get '/profile/friend_requests', to: 'friend_requests#index'
  get '/notifications', to: 'notifications#index'
end
