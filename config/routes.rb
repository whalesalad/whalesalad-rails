Whalesalad::Application.routes.draw do
  root :to => "posts#index"

  # Posts
  resources :posts
  # get "/p/:page" => "posts#index"
  # get "/s/:slug" => "posts#show"

  # Tags
  match "/tagged/:tag" => "posts#tagged", :as => "tag"

  # Admin
  namespace :admin do
    match '', :action => 'index'
    resources :posts#, only: [:index, :show, :new, :create, :update, :edit, :destroy]
    # resources :tags,  only: [:new, :create, :update, :edit, :destroy, :index]
  end
  
end
