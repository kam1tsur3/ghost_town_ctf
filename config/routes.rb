Rails.application.routes.draw do
  get 'users/new'
  root 'static_pages#home'
  get '/home', to: 'static_pages#home'
  get '/rule', to: 'static_pages#rule'
  get '/signup', to: 'users#new'
  resources :users
end
