Rails.application.routes.draw do
  # users routes
  get 'user/getuser', to: 'user#get_user'
  get 'users/index', to: 'user#index'
  get 'users/check', to: 'user#user_exists'
  post 'user/create', to: 'user#create'
  post 'users/buyclasspasses', to: 'user#purchase_passes'
  post 'users/addclasspasses', to: 'user#add_class_passes'
  patch 'user/update/:id', to: 'user#update'


  # sessions routes
  get '/sessions', to: 'session#index'
  post '/sessions/create', to: 'session#create'
  post '/sessions/returntokens', to: 'session#return_tokens'
  patch '/sessions/update/:id', to: 'session#update'
  delete '/sessions/deleted/:id', to: 'session#destroy'
  
  # userSessions routes
  get 'usersessions', to: 'user_session#class_users'
  get 'usersession/upcomingclasses', to: 'user_session#upcoming_classes'
  post 'usersession/book', to: 'user_session#book_session'
  post 'usersession/unbook', to: 'user_session#destroy'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
