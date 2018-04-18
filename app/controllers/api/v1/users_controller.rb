class Api::V1::UsersController < ApplicationController
  before_action :require_login, only: [:update, :destroy]

  def index
    if current_user
      if current_user.account_type == 'School' && current_user.is_admin
        users = User.where(account_id: current_user.account_id)
        @users = users.where(is_admin: false)
      else
        @users = User.all
      end
    else
      @users = User.all
    end

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
    else
      render json: {errors: @user.errors.full_messages}, status: 422
    end
  end

  def show
    @user = User.find(params[:id])
    render json: UserSerializer.new(@user).serialized_json
  end

  def update
    @user = current_user

    if @user.update(user_update_params)
      render json: UserSerializer.new(@user).serialized_json
    else
      render json: {errors: @user.errors.full_messages}, status: 422
    end
  end

  def destroy
    @user = current_user

    if !@user.is_admin
      if @user.account_type == "School" && @user.contracts.length > 0
        render json: {error: "Students with contracts cannnot delete their accounts"}, status: 422
      else
        @user.destroy
        @users = User.all
        render json: UserSerializer.new(@users).serialized_json
      end
    else
      render json: {error: "Admins cannot delete their accounts"}, status: 422
    end
  end

  private

  def user_params
    params.permit(:email, :first_name, :last_name, :password, :account_type, :account_id, :is_admin)
  end

  def user_update_params
    params.permit(:email, :first_name, :last_name, :password)
  end

  def require_login
    unless current_user
      render json: {error: 'No id present on headers'}, status: 404
    end
  end
end
