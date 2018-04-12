class Api::V1::SchoolsController < ApplicationController
  before_action :require_admin_school_user, only: [:update]

  def index
    @schools = School.all
    # render json: @schools
    render json: SchoolSerializer.new(@schools).serialized_json
  end

  def create
    @school = School.new(school_params)

    if @school.save
      # render json: @school
      render json: SchoolSerializer.new(@school).serialized_json
    else
      render json: {errors: @school.errors.full_messages}, status: 422
    end
  end

  def show
    @school = School.find(params[:id])
    # render json: @school
    render json: SchoolSerializer.new(@school).serialized_json
  end

  def update
    @school = School.find(params[:id])

    if @school.update(school_params)
      # render json: @school
      render json: SchoolSerializer.new(@school).serialized_json
    else
      render json: {errors: @school.errors.full_messages}, status: 422
    end
  end

  private

  def school_params
    params.permit(:name, :website, :fee, :turntime)
  end

  def require_admin_school_user
    unless current_user.account_type == 'School' && current_user.isAdmin
      render json: {error: 'School Admin account required'}, status: 404
    end
  end
end
