Rails.application.routes.draw do
  resources :line_items
  resources :carts
  resources :cameras
  resources :charges
  devise_for :users, controllers: {
    registrations: 'registrations'
  }
  root 'cameras#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
