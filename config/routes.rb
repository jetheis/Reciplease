Reciplease::Application.routes.draw do
  authenticated :user do
    root :to => 'home#home'
  end
  root :to => "home#welcome"
  devise_for :users
  resources :users
end
