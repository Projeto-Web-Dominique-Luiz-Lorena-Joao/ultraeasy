Rails.application.routes.draw do
  devise_for :users
  resources :specialities
  resources :companies

  resources :addresses do
    resources :patients, only: [:new, :create]
  end
  
  resources :patients
  
  get "up" => "rails/health#show", as: :rails_health_check


  root "patients#index"
end
