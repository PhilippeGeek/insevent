Rails.application.routes.draw do

  resources :events, only: [:index, :new, :create, :show]

  authenticate :user do
    namespace :admin do
      resources :users
      resources :events
      resources :tags
      root to: "users#index"
    end
  end
  root to: 'visitors#index'
  devise_for :users
end
