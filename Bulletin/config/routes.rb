Web::Application.routes.draw do
  resources :groups
  get 'users/sign_in' => 'events#index' #redirect default devise sign-in route to homepage
  devise_for :users, :controllers => { :omniauth_callbacks => 'my_devise/omniauth_callbacks',
  :registrations => 'my_devise/registrations'}

  resources :events do
    collection do
      get 'show_favorites'
      post 'select_groups'
      get 'feedback'
      match 'send_feedback'
      get 'profile'
      get 'interests'
      post 'save_interests'
      post 'select_filters'
      post 'select_date'
    end
    member do
      get 'favorite'
    end
  end
  match "email" => "groups#email"
  match 'static/:action' => 'static#:action'
  match 'edit_interests' => 'events#interests'
  match 'edit_groups' => 'events#profile'
  #match 'edit_account' => 'my_devise/registrations#edit'
  root :to => 'events#index'
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
  
end
