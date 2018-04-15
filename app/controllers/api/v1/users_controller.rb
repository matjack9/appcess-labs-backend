class Api::V1::UsersController < ApplicationController
  def index
    @users = User.all
    # render json: @users
    render json: UserSerializer.new(@users).serialized_json
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render json: {
        id: @user.id,
        email: @user.email,
        first_name: @user.first_name,
				last_name: @user.last_name,
				is_admin: @user.is_admin,
				account_type: @user.account_type,
				account_id: @user.account_id,
        jwt: JWT.encode({user_id: @user.id}, ENV['secret_key'], 'HS256')
      }
      # render json: @user
    else
      render json: {errors: @user.errors.full_messages}, status: 422
    end
  end

  def show
    @user = User.find(params[:id])
    # render json: @user
    render json: UserSerializer.new(@user).serialized_json
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      # render json: @user
      render json: UserSerializer.new(@user).serialized_json
    else
      render json: {errors: @user.errors.full_messages}, status: 422
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy #user cannot be only school admin?
    @users = User.all
    # render json: @users
    render json: UserSerializer.new(@users).serialized_json
  end

  private

  def user_params
    params.permit(:email, :first_name, :last_name, :password, :account_type, :account_id, :is_admin)
  end
end
