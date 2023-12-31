Rails.application.routes.draw do
  devise_for :users
  root to: "records#index"
  resources :to_dos, except: [:show, :destroy]
  resources :records, except: :show
  resources :users, only: :show
  resources :payments, only: [:index, :new, :create]
end