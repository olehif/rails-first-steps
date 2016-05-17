Rails.application.routes.draw do
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  root 'surveys#index'
  post '/increment/:id',      to: 'surveys#increment',       as: :increment
  get  '/show/:id',           to: 'surveys#show',            as: :show

  get  '/admin',              to: 'admins#index',            as: :admins_index
  get  '/admin/show/:id',     to: 'admins#show',             as: :admins_show
  post '/admin/close/:id',    to: 'admins#close',            as: :admins_close
  get  '/admin/new',          to: 'admins#new',              as: :new_question
  post '/admin/create',       to: 'admins#create',           as: :create_question
  get  '/admin/edit/:id',     to: 'admins#edit',             as: :edit_question
  get  '/admin/new_f/:id',    to: 'admins#new_f',            as: :new_field
  post '/admin/create_f',     to: 'admins#create_f',         as: :create_field
  get  '/admin/destroy_f/:id',to: 'admins#destroy_f',        as: :destroy_field
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
