Rails.application.routes.draw do
  root 'home#index'
  resources :home, only: [:index, :edit, :update]
  get 'pages/additional_info'
end
