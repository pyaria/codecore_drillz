Rails.application.routes.draw do

  root "drill_groups#index"
  resources :drill_groups
  resources :categories, only: [:create, :destroy]
  resources :answers
  devise_for :users, controllers: {
    registrations: 'registrations',
    sessions: 'users/sessions'
  }

end
