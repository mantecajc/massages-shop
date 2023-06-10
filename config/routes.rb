Rails.application.routes.draw do
  root 'home#index'
  resources :home, only: [:index, :edit, :update]
  devise_for :users
  get 'pages/additional_info'
end
