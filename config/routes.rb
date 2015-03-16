Rails.application.routes.draw do

resources :users
resources :groups
resources :members
resources :locations
resources :sessions


get "/login", to: "sessions#new"
get "/logout", to: "sessions#destroy"

root to: 'sessions#index'
  
end