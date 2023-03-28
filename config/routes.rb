Rails.application.routes.draw do
  root 'pages#home'
  get 'pages/additional_info'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
