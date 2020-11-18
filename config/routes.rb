Rails.application.routes.draw do
  devise_for :users
  resources :products,only: [:index,:new,:create,:show]
  root 'products#index'
end
