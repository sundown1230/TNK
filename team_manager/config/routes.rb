TeamManager::Application.routes.draw do
  get "materials/index"
  get "materials/edit"
  get "materials/new"
  root "dashbords#home"
  get "users/index"
  get "static_pages/contact"
  get "static_pages/usage"
  get "dashbords/home"
  
  get "projects/:id/members_edit", to:"projects#members_edit", as: "project_members_edit"
  post "projects/:id/members_edit", to:"projects#members_edit"
  delete "projects/:id/members_edit/:user_id", to:"projects#member_delete"
  
  devise_for :users
  resources :projects do
    resources :reports
	resources :tasks
  end
  resources :users

  resources :materials
  resources :accountings

  get 'accountings/:id/edit_status' => 'accountings#edit_status', as: :edit_status
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
