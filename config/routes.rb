Rails.application.routes.draw do
  devise_for :users

  get 'persons/profile'

  namespace :admin do
    resources :users, only: %i[index create edit update]
    
    resources :trains do
      resources :carriages
    end

    resources :railway_stations
    resources :routes
  end

  resources :users, only: [] do
    resources :tickets, only: %i[index show new create destroy] 
  end

  resource :searches, only: [:new, :show, :create]

  get 'welcome/index'
  get "up" => "rails/health#show", as: :rails_health_check

  root "static_pages#index"
end
