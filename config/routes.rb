Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :trips

  get "/register", to: "users#new"
  post "/users", to: "users#create"


  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  root to: "trips#index"
  resources :receipts, only: [:new, :create, :show]
end
