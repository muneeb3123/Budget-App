Rails.application.routes.draw do
  root "homes#index"
  devise_for :users
  resources :groups, only: [:index, :new, :create, :destroy] do
    resources :trades, only: [:index, :new, :create, :destroy]
  end
end
