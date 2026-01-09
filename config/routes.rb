Rails.application.routes.draw do

  # 1. หน้าแรกและ Route ปกติ
  root "home#index"
  get "home/index"

  # 2. *** เอา Login/Logout มาแทรกไว้ตรงนี้ (ก่อนบรรทัด *path) ***
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  # 3. Resources อื่นๆ
  resources :users, only: [:index, :show, :new, :create, :edit, :update]
  resources :colors, only: [:index, :show, :new, :create, :edit, :update]

  namespace :admin do
    resources :users
    resources :colors
    root "dashboard#index"
  end

  get "about" => "pages#about"
  get "contact" => "pages#contact"

  # 4. *** ตัวดัก Error 404 ต้องอยู่ "ล่างสุดของไฟล์" เสมอครับ ***
  match "*path", to: "application#not_found", via: :all

end