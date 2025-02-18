Rails.application.routes.draw do
  devise_for :users
  get 'persons/profile'

  resources :trains do
    resources :carriages
  end

  resources :railway_stations
  resources :routes

  get 'welcome/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  #get 'persons/profile', as: 'user_root'

  # Defines the root path route ("/")
  root "static_pages#index"
end
