Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "foods#index"

  resources :public_recipes, only: [:index]
  resources :general_shopping_list, only: [:show]

  resources :foods, only: [:index, :new, :create, :destroy]
  resources :recipes, only: [:index, :new, :show, :public, :create, :destroy] do
    resources :recipe_foods, only: [:index, :new, :edit, :create, :update, :destroy]
    resources :foods
  end

  resources :users do
    resources :recipes
    resources :foods
  end
end
