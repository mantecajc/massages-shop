Rails.application.routes.draw do
  root 'home#index'
  devise_for :users

  resources :massages
  resources :home, only: [:index, :edit, :update]
  resources :categories, except: [:index, :show]

  get 'pages/additional_info'
end
