Rails.application.routes.draw do

  resources :drill_groups do
    resources :drills, only: [:show, :edit, :update, :create]
  end

  root "welcome#index"
  resources :categories, only: [:create, :destroy]
  resources :answers
  resources :drills do
    resources :answers
    resources :drill_completes, only: [:create]
  end

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

end
