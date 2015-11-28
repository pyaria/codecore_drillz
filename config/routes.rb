Rails.application.routes.draw do

  devise_for :users
  # root to: "home#index"
  resources :drill_groups
  resources :categories, only: [:create, :destroy]
end
