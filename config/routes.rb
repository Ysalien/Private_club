Rails.application.routes.draw do
  root 'static_pages#home'
  resources :users
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  resources :sessions
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/members', to: 'sessions#index'
  delete '/logout', to: 'sessions#destroy'
end
