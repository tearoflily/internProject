Rails.application.routes.draw do
  get 'top/show'
  root 'employee/items#index'
#####################植松エリア##################################################################################
  namespace :employee do
    resources :items
    resources :item_image, only:[:show]
    resources :processings, only:[:new, :create, :destroy]
    resources :products, except:[:show, :edit] do
      patch :update, on: :collection
    end
    resources :products_change, only:[:index, :create]
    resources :orders, except: [:new, :create]
    resources :users
  end
#####################菅野さんエリア##################################################################################
  namespace :customer do
    resources :users
  end
  
  #resources :session, only:[:new, :create,:destroy]
  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

end
