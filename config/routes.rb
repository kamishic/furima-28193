Rails.application.routes.draw do
  devise_for :users
  resources :products,only: [:index,:new]
  root 'products#index'
end
