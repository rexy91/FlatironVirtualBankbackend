Rails.application.routes.draw do
  post '/login', to: 'users#login'
  post '/users', to: 'users#create'
  post '/users', to: 'users#generateSignUpCode'
  post '/users/:id/new_account', to: 'users#create_acc_for_existingUser'

  get '/persist', to: 'users#persist'
  patch '/account/:id/profile/update', to: 'users#updateInfo'
  post '/customer_support/complaint', to: 'users#handleComplain'
  resources :users

  patch '/checkings/:id/instant_transfer', to: 'checkings#instant_transfer'
  patch '/checkings/deposit/:id', to: 'checkings#deposit'
  patch '/checkings/withdrawal/:id', to: 'checkings#withdrawal'
  resources :checkings
  
  # patch '/savings/:id/internal_tarnsfer', to: 'savings#internal_transfer'
  resources :savings
  
  
  get '/account/:id/expense_summary', to: 'transactions#expenseSummary'
  resources :transactions

end
