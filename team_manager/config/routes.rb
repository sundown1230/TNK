TeamManager::Application.routes.draw do
  root "dashbords#home"
  
  devise_for :users
  resources :users
  resources :projects do
    resources :reports
	resources :tasks
  end

  resources :materials do
    member do
	  get "download"
	end

    collection do
	  post "upload"
	end
  end
  
  resources :accountings do
    resources :images
  end

  get "materials/categorized_index/:filetype", to:"materials#categorized_index", as: "categorized_materials_index"
  get "static_pages/contact"
  get "static_pages/usage"
  
# projectメンバー編集
  get "projects/:id/members_edit", to:"projects#members_edit", as: "project_members_edit"
  post "projects/:id/members_edit", to:"projects#members_edit"
  delete "projects/:id/members_edit/:user_id", to:"projects#member_delete"
  
  # material関連ユーザー編集
  get "materials/:id/users_edit", to:"materials#users_edit", as: "material_users_edit"
  post "materials/:id/users_edit", to:"materials#users_edit"
  delete "materials/:id/users_edit/:user_id", to:"materials#user_delete"
  
  # report関連ユーザー編集
  get "projects/:project_id/reports/:id//users_edit", to:"reports#users_edit", as: "report_users_edit"
  post "projects/:project_id/reports/:id/users_edit", to:"reports#users_edit"
  delete "projects/:project_id/reports/:id/users_edit/:user_id", to:"reports#user_delete"
  
  # task関連ユーザー編集
  get "projects/:project_id/tasks/:id//users_edit", to:"tasks#users_edit", as: "task_users_edit"
  post "projects/:project_id/tasks/:id/users_edit", to:"tasks#users_edit"
  delete "projects/:project_id/tasks/:id/users_edit/:user_id", to:"tasks#user_delete"
  
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
