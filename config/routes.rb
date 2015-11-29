Rails.application.routes.draw do

  root "drill_groups#index"
  resources :drill_groups
  resources :categories, only: [:create, :destroy, :index, :show]
  resources :answers
  resources :badges
  get "/your_badges", to: "badges#user_badges", as: :badges_of_user
  resources :drills do
    resources :answers, only: [:new, :show, :edit, :delete]
  end
  get "/leaderboard", to: "leaderboard#leaderboard", as: :leaderboard  
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

end
