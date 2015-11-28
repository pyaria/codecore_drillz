Rails.application.routes.draw do

  # root to: "home#index"
  resources :drill_groups

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  resources :answers

end
