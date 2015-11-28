Rails.application.routes.draw do

  root "drill_groups#index"
  resources :drill_groups
  resources :drills do
    resources :answers, only: [:new, :show, :edit, :delete]
  end

  devise_for :users, :controllers => {
    registrations: 'registrations',
    sessions: 'users/sessions'
  }

end
