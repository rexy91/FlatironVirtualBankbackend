Rails.application.routes.draw do
  resources :savings
  post '/login', to: 'users#login'
  post '/users', to: 'users#create'
  get '/persist', to: 'users#persist'

  resources :transactions
  resources :checkings
  resources :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
