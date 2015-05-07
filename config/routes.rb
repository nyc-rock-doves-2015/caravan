Rails.application.routes.draw do

  resource :session, only: [:new, :create, :destroy]
  resources :users
<<<<<<< HEAD
=======
  get '/profiles/:id', to: redirect('/users/%{id}')
>>>>>>> Bootstrap working, functional user and profile route to user show

  get '/profiles/:id', to: redirect('/users/%{id}')
  get 'signin' => 'sessions#new'
  post 'signin' => 'sessions#create'
  get 'signout' => 'sessions#destroy'
  get 'signup' => 'users#new'
  resources :parcels do
    resources :trips
  end

  resources :trips do
    resources :parcels
  end

<<<<<<< HEAD
 root 'users#show'
=======
>>>>>>> Bootstrap working, functional user and profile route to user show
end
