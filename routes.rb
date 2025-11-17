Rails.application.routes.draw do
  get "home/index"
  resources :users
  resources :colors
  get "up" => "rails/health#show", as: :rails_health_check

  # กำหนด root route
  root "home#index"
end
