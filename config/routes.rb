Rails.application.routes.draw do
  root "dashboards#index"

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
  resources :groups, only: [:index, :new, :create, :show] do
    resources :group_memberships, only: [:create, :destroy]
    resources :challenges, only: [:create, :show, :new]
  end
  resources :challenges, only: [:show] do
    resources :workouts, only: [:new, :create]
  end
end
