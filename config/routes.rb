Rails.application.routes.draw do

  devise_for :users
  root 'pages#home'
  match '/photos/tab', to: 'photos#tabs', via: 'get', as: :photos_tabs
  #match '/photos/all', to: 'photos#index', via: 'get'
  resources :photos
  resources :podcasts
  resources :posts
  resources :extra
  
  match '/contact', to: 'pages#contact', via: 'get'
  match '/about', to: 'pages#about', via: 'get'
  match '/rss', to: 'podcasts#feed', via: 'get', format: 'xml'
  match '/subsink', to: 'pages#game', via: 'get'
  match '/subsinkinfo', to: 'pages#gameInfo', via: 'get'

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
