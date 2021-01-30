Rails.application.routes.draw do
  root to: 'home#top'
  get 'home/about', to: 'home#about'
  
  devise_for :users
  get 'users/show'

  resources :books, only: [:create,:edit,:update,:index,:show,:destroy]
  resources :users, only: [:show,:edit,:update,:index]
end