Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :accounts, only: [:index, :show, :new, :create, :destroy] do
    resources :transactions, only: [:index, :show]
  end
  resources :categories, only: [:index, :show, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
