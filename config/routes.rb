Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :registrations, only: [:new, :create]
  get "reviews/create"
  get "reviews/destroy"
  # get "sessions/new" # removed, handled by resource :session
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

    namespace :admin do
      resources :dashboard, except: [:show]
      resources :products
    end

    resources :products, only: [:index, :show] do
      collection do
        get :search
      end
    end
    resources :categories, only: [:index, :show]
    resource :cart, only: [:show] do
      post :add
      post :remove
      post :update
    end
    resources :orders, only: [:new, :create, :show, :index]
  resource :session, only: [:new, :create, :destroy]
    resources :reviews, only: [:create, :destroy]

    root 'products#index'

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
