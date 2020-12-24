Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "items#index"
  resources :items do
    member do
      resources :orders, only: [:index, :create]
      resources :favorites, only: [:create, :destroy]
    end
  end
end
