Rails.application.routes.draw do
  resources :orders
  resources :line_items
  resources :carts
  resources :cameras do
    get :who_bought, on: :member
  end
  resources :charges, only: [:new, :create]
  get 'thanks', to: 'charges#thanks', as: 'thanks'

  devise_for :users, controllers: {
    registrations: 'registrations'
  }

  root 'cameras#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
