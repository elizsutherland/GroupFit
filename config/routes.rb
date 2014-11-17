Rails.application.routes.draw do
  root "groupfit#index"

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  resources :groupfit, only: [:new, :create]
end
