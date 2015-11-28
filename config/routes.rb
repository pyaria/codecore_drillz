Rails.application.routes.draw do

  root "drill_groups#index"
  resources :drill_groups do
    resources :drills, only: [:show, :edit, :update]
  end
  resources :categories, only: [:create, :destroy]
  resources :answers
  resources :drills do
    resources :answers, only: [:new, :show, :edit, :delete]
  end
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

end
