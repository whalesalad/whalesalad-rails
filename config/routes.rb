Whalesalad::Application.routes.draw do
  root :to => "posts#index"

  # Posts
  resources :posts
  # get "/p/:page" => "posts#index"
  # get "/s/:slug" => "posts#show"

  # Tags
  match "/tagged/:tag" => "posts#tagged", :as => "tag"
  # match "/t/:tag/p/:page" => "posts#tagged"
  
end
