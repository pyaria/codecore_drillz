Rails.application.routes.draw do

  devise_for :users
  # root to: "home#index"
  resources :drill_groups do
    resources :drills
  end

end
