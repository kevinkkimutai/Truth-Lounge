class ApplicationController < ActionController::API
  before_action :authorize_request
  attr_reader :current_user

  #...

  private

  def authorize_request
  header = request.headers['Authorization']
  header = header.split(' ').last if header

  begin
    decoded = JWT.decode(header, Rails.application.secrets.secret_key_base, true, algorithm: 'HS256')
    @current_user_id = decoded[0]['user_id']
    @current_user = User.find_by(id: @current_user_id)
  rescue JWT::DecodeError
    render json: { error: 'Invalid token' }, status: :unauthorized
    return
  end

  unless @current_user && authorized?
    render json: { error: 'You are not authorized to access this page.' }, status: :forbidden
  end
end
def authorized?
  return true if @current_user.role == 'Manager' || @current_user.role == 'CEO' || @current_user.role == 'Employee'

  # Return false if not authorized
  false
end

end
