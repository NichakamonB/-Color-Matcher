Rails.application.routes.draw do
  # หน้า homepage
  root "home#index"
  get "home/index"

  # Users and Colors resources (กำหนดเฉพาะ action ที่ใช้จริง)
  resources :users, only: [:index, :show, :new, :create, :edit, :update]
  resources :colors, only: [:index, :show, :new, :create, :edit, :update]

  # Health check endpoint (สำหรับ monitoring)
  # แนะนำให้จำกัด IP ของ monitoring server ใน controller
  get "up" => "rails/health#show", as: :rails_health_check

  # Namespace สำหรับ admin panel
  namespace :admin do
    resources :users
    resources :colors
    root "dashboard#index"
  end

  # Static pages หากมีหลายหน้า
  # controller: PagesController, action: about, contact
  get "about" => "pages#about"
  get "contact" => "pages#contact"

  # Catch-all route สำหรับ 404 (ต้องวางไว้ท้ายสุด)
  # แนะนำใน production เท่านั้น
  match "*path", to: "application#not_found", via: :all
end
