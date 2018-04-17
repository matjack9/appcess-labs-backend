class Api::V1::SchoolsController < ApplicationController
  before_action :require_admin_school_user, only: [:update]

  def index
    @schools = School.all
    render json: SchoolSerializer.new(@schools).serialized_json
  end

  def create
    @school = School.new(school_params)

    if @school.save
      render json: SchoolSerializer.new(@school).serialized_json
    else
      render json: {errors: @school.errors.full_messages}, status: 422
    end
  end

  def show
    @school = School.find(params[:id])
    render json: SchoolSerializer.new(@school).serialized_json
  end

  def show_by_key # incoming key params serve for both admin and non-admin
    @school = School.find_by(admin_key: school_params[:key])
    if @school
      render json: SchoolSerializer.new(@school).serialized_json
    else
      @school = School.find_by(key: school_params[:key])
      if @school
        render json: SchoolSerializer.new(@school).serialized_json
      end
    end
  end

  def update
    @school = School.find(params[:id])

    if @school.update(school_params)
      render json: SchoolSerializer.new(@school).serialized_json
    else
      render json: {errors: @school.errors.full_messages}, status: 422
    end
  end

  private

  def school_params
    params.permit(:name, :website, :fee, :turntime, :image_url, :key, :admin_key)
  end

  def require_admin_school_user
    unless current_user.account_type == 'School' && current_user.is_admin
      render json: {error: 'School Admin account required'}, status: 404
    end
  end
end
