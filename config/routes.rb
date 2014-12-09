Rails.application.routes.draw do
  root "dashboards#index"

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:index, :new, :create, :show] do
    resources :friendships, only: [:create, :destroy, :update]
  end
  resources :groups do
    resources :group_memberships, only: [:create, :destroy]
    resources :challenges, only: [:create, :show, :new]
  end
  resources :challenges, only: [:show] do
    resources :workouts, only: [:new, :create, :edit]
  end
  resources :workouts, only: [:show] do
    resource :like, only: [:create, :destroy]
  end
end
