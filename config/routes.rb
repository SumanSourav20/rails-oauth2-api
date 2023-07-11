Rails.application.routes.draw do
  use_doorkeeper do
    skip_controllers :authorizations, :applications, :authorized_applications
  end
  devise_for :users
  resources :uploads


  namespace :api do
    namespace :v1 do
      scope :users, module: :users do
        post '/', to: 'registrations#create', as: :user_registration
      end
      resources :uploads, only: [:index,:create]
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "uploads#index"

  scope :api do
    scope :v1 do
      use_doorkeeper do
        skip_controllers :authorizations, :applications, :authorized_applications
      end
    end
  end
end
