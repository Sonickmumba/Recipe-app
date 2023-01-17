Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "foods#index"

  resources :foods, only: [:index, :new, :create, :destroy]
  resources :recipes, only: [:index, :new, :show, :public, :create, :destroy] do
    resources :recipe_foods, only: [:index, :new, :create, :destroy]
  end

  resources :public_recipes, only: [:index]
  resources :general_shopping_list, only: [:show]
end
