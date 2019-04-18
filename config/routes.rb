Rails.application.routes.draw do
  # resources :entries, only: [:show]
  resources :plans, only: [:show, :index]
  resources :foods, only: [:show, :index]
  devise_for :admin_users, ActiveAdmin::Devise.config
  root to: "plans#index"
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
