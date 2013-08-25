Anabol::Application.routes.draw do


  #match 'auth/:provider/callback', to: 'sessions#create'
  #match 'auth/failure', to: redirect('/')
  #match 'signout', to: 'sessions#destroy', as: 'signout'

  resources :versions,  :path => "/verziok"#, :only => [:edit, :update, :index, :new, :creae],
  resources :meta_reports

  devise_scope :user do
    get '/felhasznalok/auth/:provider' => 'users/omniauth_callbacks#passthru'
    get "/belepes" => "devise/sessions#new"
    get "/regisztracio" => "devise/registrations#new"
    match "/kilepes" => "devise/sessions#destroy"
  end

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  get "/meta", to: "static_pages#meta"
  get "/adatvedelem", to: "static_pages#adatvedelem"
  get "/feltetelek", to: "static_pages#feltetelek"
  get "/users", to: "static_pages#users"

  Inboxes::Engine.routes.draw do
    resources :discussions, :except => :edit, :module => :inboxes do
      resources :messages, :only => [:create, :index]
      resources :speakers, :only => [:create, :destroy]
      member do
        post 'leave'
      end
    end
  end


  resources :relationships, only: [:create, :destroy]
  #resources :users
  root :to => "static_pages#home"

  get 'kereses' => 'profiles#index'

  resources :profiles, :only => [:show, :edit, :update, :destroy, :index], :path => "/profil" do
     resources :sizes, :path => "meres"
     resources :workouts, :path => "edzes"
     resources :photos, :path => "kepek"
    member do
      get :following, :followers
    end
    #member do
    #  get 'image'
    #end
  end


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
  # match ':controller(/:action(/:id))(.:format)'
end
