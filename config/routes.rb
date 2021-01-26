Rails.application.routes.draw do
  get 'challenges/new'
  root 'static_pages#home'
  get '/home', to: 'static_pages#home'
  get '/rule', to: 'static_pages#rule'
  
  get '/signup', to: 'users#new'
  
  get '/create_team', to: 'teams#new'
  get '/my_team', to:'teams#my_team'
  get '/reg_team', to:'teams#reg_team'
  get '/join', to:'teams#join_form'
  post '/join', to: 'teams#join_team'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  resources :users
  resources :teams
end
