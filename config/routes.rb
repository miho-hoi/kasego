Rails.application.routes.draw do
  devise_for :users
  root to: "records#index"
  resources :to_dos, except: [:show, :destroy]
end
