Rails.application.routes.draw do
  # users routes
  get 'user/:id', to: 'users#show'
  post 'user/create', to: 'users#create'
  get 'user/login', to: 'users#login'

  # sessions routes
  get '/sessions', to: 'sessions#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
