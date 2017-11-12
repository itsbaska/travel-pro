Rails.application.routes.draw do
  resources :trips do
    resources :receipts, only: [:index, :new, :create]
  end

  get '/users/sign_up', to: 'users#new', as: 'new_user'
  post '/users', to: 'users#create'
  get '/users/:id', to: 'users#show', as: 'user'

  resources :trips do
    resources :outbounds
    resources :inbounds
  end

  get "/login", to: "sessions#new"
  post "/sessions", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/users/:id/dashboards", to: "dashboards#show", as: 'user_dashboard'

  root to: "trips#index"
end
