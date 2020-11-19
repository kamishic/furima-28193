Rails.application.routes.draw do
  devise_for :users
  resources :products do
    resources :purchases, only:[:index,:create]
  end
  root 'products#index'
end
