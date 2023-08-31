Rails.application.routes.draw do
  root "homes#index"
  devise_for :users
  resources :users do
  resources :groups, only: [:index, :new, :show, :create, :destroy] do
    resources :trades, only: [:index, :new, :create, :destroy]
  end
end
end
