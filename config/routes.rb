Rails.application.routes.draw do
  root to: 'application#home'

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/logout', to: 'sessions#delete'

  resources :users
  resources :attractions
  resources :rides, only: [:create]
end
