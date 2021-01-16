Rails.application.routes.draw do
  get 'top/show'
  root 'employee/items#index'
#####################植松エリア##################################################################################
  namespace :employee do
    resources :items
    resources :item_image, only:[:show]
  end
#####################菅野さんエリア##################################################################################

end
