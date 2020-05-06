Rails.application.routes.draw do
  # users routes
  get 'user/getuser', to: 'user#get_user'
  get 'users/index', to: 'user#index'
  get 'users/getallattendances', to: 'user#get_all_attendances'
  get 'users/check', to: 'user#user_exists'
  post 'user/create', to: 'user#create'
  post 'users/buyclasspasses', to: 'user#purchase_passes'
  post 'users/addclasspasses', to: 'user#add_class_passes'
  post 'users/payforptsession', to: 'user#pay_for_pt_session'
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


  # activities routes
  get 'activities/getuseractivities', to: 'activity#get_user_activities'
  post 'activities/create', to: 'activity#create'

  #PtSession routes
  post 'ptsessions/create', to: 'ptsession#create'
  post 'ptsessions/confirmptsession', to: 'ptsession#confrim_pt_session'
  patch 'ptsessions/update/:id', to: 'ptsession#update'
  delete 'ptsessions/delete/:id', to: 'ptsession#destroy'


  # UserPtSessionRoutes
  get 'userptsession/upcomingptsessions', to: 'user_pt_sessions#get_user_pt_sessions'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
