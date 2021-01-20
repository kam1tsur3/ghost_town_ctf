Rails.application.routes.draw do
  get 'teams/new'
  root 'static_pages#home'
  get '/home', to: 'static_pages#home'
  get '/rule', to: 'static_pages#rule'
  get '/signup', to: 'users#new'
  get '/create_team', to: 'teams#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users
  resources :teams
end
