Rails.application.routes.draw do
  resources :orders
  resources :distribution_centers
  resources :personas
  resources :factories
  resources :products
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
end
