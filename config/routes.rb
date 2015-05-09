Rails.application.routes.draw do

  resource :session, only: [:new, :create, :destroy]

  resources :users do
    resources :reviews
  end

  get '/profiles/:id', to: 'users#show'
  get 'signin' => 'sessions#new'
  post 'signin' => 'sessions#create'
  get 'signout' => 'sessions#destroy'
  get 'signup' => 'users#new'

  get 'profile', to: 'users#current'
  get 'match', to: 'parcels#match_trips'

  resources :parcels do
    resources :trips
    resources :reviews
  end

  resources :trips do
    resources :parcels
    resources :reviews
  end

 root to: 'application#index'

end