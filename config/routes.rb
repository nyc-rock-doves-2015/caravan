Rails.application.routes.draw do

  resource :session, only: [:new, :create, :destroy]
  resources :user

  get 'profile', to: 'users#show'

  resources :parcels do
    resources :trips
  end

  resources :trips do
    resources :parcels
  end

  # TODO: need root route
end
