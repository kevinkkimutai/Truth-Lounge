class UsersController < ApplicationController
  skip_before_action :authorize_request, only: [:create_ceo,:employees_by_manager, :reset_password, :update_password]
  include CanCan::ControllerAdditions

  def index
    user = @current_user
    render json: {user: user}
  end

  
  # CEO action
  def create_ceo
    user = User.new(user_params)
    user.role = 'CEO'
    if user.save
      token = encode_token(user)
      render json: { user: user, token: token }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # Manager action
  def create_manager
    if current_user.role!= 'CEO'
      render json: { error: 'Only the CEO can create managers.' }, status: :unauthorized
      return
    end

    user = User.new(user_params)
    user.role = 'Manager'

  # Set the manager's ceo_id to the ID of the logged-in CEO
  user.ceo_id = @current_user.id if @current_user&.ceo?

    if user.save
      token = encode_token(user)
      render json: { user: user, token: token }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # employee action
  def create_employee
    if current_user.role!= 'Manager'
      render json: { error: 'Only the CEO can create managers.' }, status: :unauthorized
      return
    end
    user = User.new(user_params)
    user.role = 'Employee'
     
  # Set the manager's ceo_id to the ID of the logged-in CEO
  user.manager_id = @current_user.id if @current_user&.manager?

    if user.save
      token = encode_token(user)
      render json: { user: user, token: token }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end
  
  

  def reset_password
    user = User.find_by(email: params[:email])
    if user
      user.generate_reset_password_token
      if user.save
        render json: { message: 'Reset password token generated', reset_password_token: user.reset_password_token }
      else
        render json: { error: 'Failed to save reset password token' }, status: :unprocessable_entity
      end
    else
      render json: { error: 'User not found' }, status: :not_found
    end
  end

  def update_password
    user = User.find_by(reset_password_token: params[:reset_password_token])
    
    if user && user.reset_password_token_valid?
      if user.update(password_params)
        render json: { message: 'Password updated successfully' }
      else
        render json: { error: user.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { error: 'Invalid or expired reset password token' }, status: :unprocessable_entity
    end
  end
  
  private
  
  def password_params
    params.permit(:password, :password_confirmation)
  end
  

  def user_params
    params.permit(:firstname, :lastname, :email, :password, :password_confirmation)
  end
  

  def encode_token(user)
    JWT.encode({ user_id: user.id }, Rails.application.credentials.secret_key_base, 'HS256')
  end
end
