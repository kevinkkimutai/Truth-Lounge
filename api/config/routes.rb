Rails.application.routes.draw do
  
 # reset password
 post "reset_password", to: "users#reset_password"
 put "update_password/:reset_password_token", to: "users#update_password"
 put "reset_password/:reset_password_token", to: "users#update_password"

 post '/ceos', to: 'users#create_ceo'
 post '/managers', to: 'users#create_manager'
 post '/employees', to: 'users#create_employee'
 get '/user', to: 'users#index'
 get '/managers/:id/employees', to: 'users#employees_by_manager', as: 'employees_by_manager'

 # user login/register
 post "/users/login", to: "authentication#login"
 post "/users/register", to: "users#create"

end
