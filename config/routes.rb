Mommychannel::Application.routes.draw do
  ActiveAdmin.routes(self)
  root to: "home#index"
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"},
                    controllers: {omniauth_callbacks: "omniauth_callbacks"}
  resources :users, :only => [:index, :show, :edit, :update]

  # from scratch omniauth stuff
  # match '/auth/:provider/callback' => 'sessions#create'
  # match '/signin' => 'sessions#new', :as => :signin
  # match '/signout' => 'sessions#destroy', :as => :signout
  # match '/auth/failure' => 'sessions#failure'
end
