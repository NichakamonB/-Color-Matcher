Rails.application.routes.draw do

  root "home#index"
  get "home/index"

  resources :users, only: [:index, :show, :new, :create, :edit, :update]
  resources :colors, only: [:index, :show, :new, :create, :edit, :update]

  namespace :admin do
    resources :users
    resources :colors
    root "dashboard#index"
  end

  get "about" => "pages#about"
  get "contact" => "pages#contact"

  match "*path", to: "application#not_found", via: :all

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

end
