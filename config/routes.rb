Reciplease::Application.routes.draw do
  
  resources :recipes
  match "/recipes/:id/personalize" => "recipes#personalize", :as => :personalize_recipe
  match "/recipes/:id/history" => "recipes#history", :as => :recipe_history
  
  resources :comments
  post 'comments/add_comment'
  
  # Need to add routes for pretty URLs
  # match 'recipes/:id/:name' => 'recipes#show'

  resources :ratings, :only => [:create, :update, :destroy]
  
  authenticated :user do
    root :to => 'home#home'
  end
  
  root :to => "home#welcome"
  devise_for :users
  resources :users
end
