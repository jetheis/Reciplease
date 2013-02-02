Reciplease::Application.routes.draw do
  opinio_model

  resources :recipes
  resources :recipes do
    opinio
  end
  
  authenticated :user do
    root :to => 'home#home'
  end
  root :to => "home#welcome"
  devise_for :users
  resources :users
end
