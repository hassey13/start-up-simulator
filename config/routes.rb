Rails.application.routes.draw do

  root 'personas#new'

  resources :orders
  resources :distribution_centers
  resources :personas
  resources :factories
  resources :products
  resources :users

end
