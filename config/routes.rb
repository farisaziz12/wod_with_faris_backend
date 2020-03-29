Rails.application.routes.draw do
  # users routes
  post 'user/create', to: 'user#create'
  get 'user/getuser', to: 'user#get_user'


  # sessions routes
  get '/sessions', to: 'session#index'

  # userSessions routes
  get 'usersessions', to: 'user_session#class_users'
  post 'usersession/book', to: 'user_session#book_session'
  post 'usersession/unbook', to: 'user_session#destroy'
  get 'usersession/upcomingclasses', to: 'user_session#upcoming_classes'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
