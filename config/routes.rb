Rails.application.routes.draw do

  post '/login', to: 'users#login'
  post '/users', to: 'users#create'
  post '/users/:id/new_account', to: 'users#create_acc_for_existingUser'
  get '/persist', to: 'users#persist'
  patch '/account/:id/profile/update', to: 'users#updateInfo'
  post '/customer_support/complaint', to: 'users#handleComplain'
  resources :users

  patch '/checkings/deposit/:id', to: 'checkings#deposit'
  patch '/checkings/withdrawal/:id', to: 'checkings#withdrawal'
  resources :checkings
  resources :savings

  get '/account/:id/expense_summary', to: 'transactions#expenseSummary'
  resources :transactions

end
