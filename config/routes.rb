Reciplease::Application.routes.draw do
  resources :recipes

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
end
