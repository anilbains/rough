Rails.application.routes.draw do

resources :users
resources :groups
resources :members
resources :locations

root to: 'users#index'
  
end