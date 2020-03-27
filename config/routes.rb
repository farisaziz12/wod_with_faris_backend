Rails.application.routes.draw do
  get 'class/index'
  get 'class/show'
  get 'class/new'
  get 'class/create'
  get 'class/edit'
  get 'class/update'
  get 'class/destroy'
  get 'user/show'
  get 'user/create'
  get 'user/new'
  get 'user/edit'
  get 'user/update'
  get 'user/destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
