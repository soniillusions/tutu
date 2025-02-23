Rails.application.routes.draw do
  devise_for :users
  get 'persons/profile'

  resources :trains do
    resources :carriages
  end

  resources :railway_stations
  resources :routes

  resource :searches, only: [:new, :show, :create]

  get 'welcome/index'
  get "up" => "rails/health#show", as: :rails_health_check

  root "static_pages#index"
end
