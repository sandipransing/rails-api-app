Rails.application.routes.draw do

  resources :posts
  post 'authenticate', to: 'authentication#authenticate'
  get '/api' => redirect('/swagger/dist/index.html?url=/api/api-docs.json')
end
