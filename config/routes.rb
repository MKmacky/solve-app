Rails.application.routes.draw do
  get 'comments/index'
  devise_for :users
  get 'problems/index'
  root to: "problems#index"
  resources :users, only: [:edit, :update]
  resources :problems, only: [:index, :new, :create, :show] do
    resources :comments, only: [:index, :create]
  end
end
