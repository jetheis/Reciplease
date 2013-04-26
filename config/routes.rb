Reciplease::Application.routes.draw do
  
  ## Override default devise functions with registration controller
  devise_for :users, :controllers => { :registrations => 'registrations' }
  
  match "/users/reactivation" => "users#reactivation", :as => :reactivation
  match "/users/reactivate" => "users#reactivate", :as => :reactivate
  resources :users, :only => [:show]

  resources :recipes
  match "/recipes/:id/personalize" => "recipes#personalize", :as => :personalize_recipe
  match "/recipes/:id/history" => "recipes#history", :as => :recipe_history
  
  resources :comments

  resources :ratings, :only => [:create, :update, :destroy]
  
  authenticated :user do
    root :to => 'home#home'
  end
  root :to => "home#welcome"
  
  match "/gettingStarted" => "home#gettingStarted", :as => :gettingStarted
  
end
