Rails.application.routes.draw do
  root 'home#index'
  devise_for :users

  resources :massages
  resources :home, only: %i[index edit update]
  resources :info, only: %i[index edit update]
  resources :categories, except: %i[index show]

  post 'contact', to: 'info#contact', as: 'contact'
end
