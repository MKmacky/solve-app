Rails.application.routes.draw do
  
  devise_for :users
  
  root to: "problems#index"

  resources :users, only: [:edit, :update]
  resources :problems, only: [:index, :new, :create, :show, :destroy] do
    resources :comments, only: [:create]
  end
  
end
