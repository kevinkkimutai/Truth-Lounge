Rails.application.routes.draw do
  
 # reset password
 post "reset_password", to: "users#reset_password"
 put "update_password/:reset_password_token", to: "users#update_password"
 put "reset_password/:reset_password_token", to: "users#update_password"

 # user login/register
 post "/users/login", to: "authentication#login"
 post "/users/register", to: "users#create"

end
