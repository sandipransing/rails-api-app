Rails.application.routes.draw do

  resources :posts
  post 'authenticate', to: 'authentication#authenticate'
  resources :apidocs, only: [:index]
end
