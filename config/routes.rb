Rails.application.routes.draw do
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
 
  get '/download', to: 'challenges#download'
  get '/admin', to: 'challenges#admin'
  
  get '/scoreboard', to: 'submits#scoreboard'
  post '/submit', to: 'submits#submit'

  resources :users
  resources :teams
  resources :challenges
end
