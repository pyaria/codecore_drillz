Rails.application.routes.draw do

  root "welcome#index"
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :drill_groups, only: [:new, :edit, :delete, :create, :index]
  resources :drill_groups, only: [:show] do
    resources :drills
  end
  resources :categories, only: [:create, :destroy, :index, :show]
  resources :answers
  resources :badges
  get "/your_badges", to: "badges#user_badges", as: :badges_of_user
  get "/leaderboard", to: "leaderboard#leaderboard", as: :leaderboard
  resources :drills, only: [] do
    resources :answers, only: [:show, :edit, :delete, :create]
    resources :drill_completes, only: [:create]
  end
end
