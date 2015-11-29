Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  #mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :drill_groups do
    resources :drills
  end

  root "welcome#index"
  resources :categories, only: [:create, :destroy]
  resources :answers

  resources :drills, only: [] do
    resources :answers, only: [:new, :show, :edit, :delete, :create]
    resources :drill_completes, only: [:create]
  end

end
