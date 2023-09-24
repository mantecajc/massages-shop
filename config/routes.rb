Rails.application.routes.draw do
  root 'home#index'
  devise_for :users

  resources :massages
  resources :home, only: %i[index edit update]
  resources :categories, except: %i[index show]

  get 'infos_pratiques', to: 'info#index', as: 'info_index'
  post 'contact', to: 'info#contact', as: 'contact'
end
