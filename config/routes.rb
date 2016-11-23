Rails.application.routes.draw do

  get 'admins/new'

  resources :categories
  resources :homes
  resources :orders
  resources :products
  resources :users
  get 'sessions/new'

  get 'users/new'
  
  resource :home
  

  get "log_out" => "sessions#destroy", :as => "log_out"
get "log_in" => "sessions#new", :as => "log_in"
get "sign_up" => "users#new", :as => "sign_up"
get "index" => "home#index"
get "cart" => "users#cart"
get 'shoppingcarts' => 'orders#shoppingcarts'
post "checkout" => "users#checkout"
post 'orders/create' => 'orders#create'
post 'updateQuantity' => 'orders#updateQuantity'
root :to => "home#index"
post 'index' => 'orders#create'
post 'removeItem' => 'orders#destroyItem'
post 'deliverOrder' => 'orders#deliverOrder'
post 'increasePopularity' => 'products#increasePopularity'
post 'search' => 'products#searchForum'
get 'search' => 'products#search'
get 'myorders' => 'orders#myorders'

resources :users
resources :sessions
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
