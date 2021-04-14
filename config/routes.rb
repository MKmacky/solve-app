Rails.application.routes.draw do
  
  devise_for :users
  
  root to: "problems#index"

  resources :users, only: [:edit, :update, :show]
  resources :problems, only: [:index, :new, :create, :show, :destroy] do
    resources :comments, only: [:create]
    collection do
      get 'search'
    end
  end

end
