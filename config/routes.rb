Rails.application.routes.draw do

  resource :session, only: [:new, :create, :destroy]
  get 'signin' => 'sessions#new'

  # Do you really need these?  Couldn't the template redirect to the
  # session/#create from within the view for you?  The user will never see this
  # pretty URL
  post 'signin' => 'sessions#create'
  get 'signout' => 'sessions#destroy'

  get 'signup' => 'users#new'

  resources :users, only: [:new, :create, :show] do
    resources :reviews
  end

  get '/profiles/:id', to: 'users#show'
  get 'profile', to: 'users#current'
  get 'profile/history', to: 'users#history'

  # Hm, this action is kind of hard for me to understand, why would we
  # match_reviwer?
  get 'review_trips/:id', to: 'trips#match_reviewer'
  get 'review_parcels/:id', to: 'parcels#match_reviewer'

  # Whoa, whoa, what? We're adding messaging here?  Gosh.  I'm not sure that
  # the core controllers are pretty and well-done, it feels like this is
  # widening the scope considerably.
  get '/inbox', to: 'messages#index'
  post '/compose', to: 'messages#new'

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
