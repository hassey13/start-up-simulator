Rails.application.routes.draw do

  root 'personas#new'


  resources :sessions
  resources :personas_sessions
  resources :orders
  resources :distribution_centers
  resources :personas
  resources :factories
  resources :products
  resources :users

  get '/users/new', to: 'users#new', as: 'sign_up'
  delete '/sessions', to: 'sessions#destroy', as: 'logout'
  delete '/personas_sessions', to: 'personas_sessions#destroy', as: 'logout_persona'
  delete '/users', to: 'users#destroy', as: 'delete_user'
  delete '/personas', to: 'personas#destroy', as: 'delete_persona'

  post '/distribution_centers/:id', to: 'distribution_centers#stock_product', as: 'stock_product'

  post '/game', to: 'game#advance_time', as: 'advance_time'

end
