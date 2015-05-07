Rails.application.routes.draw do

  resource :session, only: [:new, :create, :destroy]
  resources :users
  get '/profiles/:id', to: redirect('/users/%{id}')

  resources :parcels do
    resources :trips
  end

  resources :trips do
    resources :parcels
  end

 root 'users#show'

end
