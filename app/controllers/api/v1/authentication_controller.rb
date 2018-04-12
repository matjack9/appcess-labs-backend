class Api::V1::AuthenticationController < ApplicationController
  def create
    user = User.find_by(email: auth_params[:email])
    if user && user.authenticate(auth_params[:password])
      render json: {
        id: user.id,
        email: user.email,
        first_name: user.first_name,
				last_name: user.last_name,
				is_admin: user.is_admin,
				account_type: user.account_type,
				account_id: user.account_id,
        jwt: JWT.encode({user_id: user.id}, ENV['secret_key'], 'HS256')
      }
    else
      render json: {error: 'User not found'}, status: 404
    end
  end

  def show
    if current_user
      render json: {
        id: current_user.id,
        email: current_user.email,
        first_name: current_user.first_name,
				last_name: current_user.last_name,
				is_admin: current_user.is_admin,
				account_type: current_user.account_type,
				account_id: current_user.account_id
      }
    else
      render json: {error: 'No id present on headers'}, status: 404
    end
  end

  private

  def auth_params
    params.require(:authentication).permit(:email, :password)
  end
end
