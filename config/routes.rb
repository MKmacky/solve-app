Rails.application.routes.draw do
  get 'comments/index'
  devise_for :users
  get 'problems/index'
  root to: "problems#index"
  resources :users, only: [:edit, :update]
  resources :problems, only: [:index, :new, :create, :show, :destroy] do
    resources :comments, only: [:create]
  end
end
