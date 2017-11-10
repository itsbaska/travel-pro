Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "trips#index"
  resources :receipts, only: [:new, :create, :show]
 # get '/receipts/new', to: "receipts#new"
 # post '/receipts', to: "receipts#create"
end
