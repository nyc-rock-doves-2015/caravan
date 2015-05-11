Rails.application.routes.draw do

  resource :session, only: [:new, :create, :destroy]
  get 'signin' => 'sessions#new'
  post 'signin' => 'sessions#create'
  get 'signout' => 'sessions#destroy'
  get 'signup' => 'users#new'

  resources :users, only: [:new, :create, :show] do
    resources :reviews
  end

  get '/profiles/:id', to: 'users#show'
  get 'profile', to: 'users#current'
  get 'profile/history', to: 'users#history'

  get 'review_trips/:id', to: 'trips#match_reviewer'
  get 'review_parcels/:id', to: 'parcels#match_reviewer'

  get '/inbox', to: 'messages#index'

  resources :messages, only: [:new, :create, :index]

  resources :reviews

  resources :parcels do
    resources :reviews, only: [:new, :create, :destroy]
    resources :trips, only: [:index] do
      get 'book', :on => :member
    end
  end

  resources :trips do
    resources :parcels, only: [:index]
    resources :reviews, only: [:new, :create, :destroy]
  end

 root to: 'application#index'

end