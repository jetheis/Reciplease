Reciplease::Application.routes.draw do
  resources :recipes
  authenticated :user do
    root :to => 'home#home'
  end
  root :to => "home#welcome"
  devise_for :users
  resources :users
  map.user '/:name', :controller => 'users'
end
