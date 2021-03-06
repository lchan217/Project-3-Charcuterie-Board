Rails.application.routes.draw do
  get '/auth/github/callback', to: 'sessions#github_create'
  get '/auth/google_oauth2/callback', to: 'sessions#google_create'
  get '/auth/twitter/callback', to: 'sessions#twitter_create'
  get 'auth/failure', to: redirect('/')

  get 'signout', to: 'sessions#destroy', as: 'signout'
  root to: 'sessions#home'
  post '/login' => 'sessions#create'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/user' => 'users#show'

  get '/all_restaurants_in_database' => 'locations#all_restaurants_in_db'

  resources :locations
  resources :restaurants
  resources :items

  resources :restaurants, only: [:show, :index] do
    resources :items
  end
end
