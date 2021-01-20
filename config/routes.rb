Rails.application.routes.draw do
  get 'sessions/new'
  get 'top/show'
  root 'employee/items#index'
  
  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
#####################植松エリア##################################################################################
  namespace :employee do
    resources :items
    resources :item_image, only:[:show]
    resources :processings, only:[:new, :create]
  end
#####################菅野さんエリア##################################################################################
  namespace :customer do
    resources :users
  end


end
