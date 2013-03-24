Reciplease::Application.routes.draw do
  
  ## Override default devise functions with registration controller
  devise_for :users, :controllers => { :registrations => 'registrations' }
  
  # resources :users, :only => [:show]

  resources :recipes
  match "/recipes/:id/personalize" => "recipes#personalize", :as => :personalize_recipe
  match "/recipes/:id/history" => "recipes#history", :as => :recipe_history
  
  resources :comments
  post 'comments/add_comment'

  resources :ratings, :only => [:create, :update, :destroy]
  
  authenticated :user do
    root :to => 'home#home'
  end
  root :to => "home#welcome"
  
end
