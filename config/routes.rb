Whalesalad::Application.routes.draw do
  root :to => "posts#index"

  # Posts
  resources :posts, :only => [:index, :show]
  
  # Tags + Pagination
  get '/tagged/:tag(/page/:page)' => "posts#index", :as => 'tagged'
  get 'page/:page' => 'posts#index', :as => 'page'

  # Admin
  namespace :admin do
    match '', :action => 'index'
    resources :posts#, only: [:index, :show, :new, :create, :update, :edit, :destroy]
    # resources :tags,  only: [:new, :create, :update, :edit, :destroy, :index]
  end
  
end
