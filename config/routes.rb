Whalesalad::Application.routes.draw do
  root :to => "posts#index"

  # Posts
  resources :posts, :only => [:index, :show] do
    # get "/p/:page" => "posts#index"
  end
  
  # Tags
  match "/tagged/:tag" => "posts#index", :as => "tagged"

  # Admin
  namespace :admin do
    match '', :action => 'index'
    resources :posts#, only: [:index, :show, :new, :create, :update, :edit, :destroy]
    # resources :tags,  only: [:new, :create, :update, :edit, :destroy, :index]
  end
  
end
