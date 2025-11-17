Rails.application.routes.draw do
  # หน้า homepage
  root "home#index"
  
  # ตัวอย่าง resource (ถ้ามี)
  resources :users, only: [:index, :show, :new, :create, :edit, :update]
  resources :colors, only: [:index, :show, :new, :create, :edit, :update]

  # Health check
  get "up" => "rails/health#show", as: :rails_health_check

  # Catch-all สำหรับ 404 (optional)
  match "*path", to: "application#not_found", via: :all
end
