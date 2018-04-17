class Api::V1::ProjectsController < ApplicationController
  before_action :require_login
  before_action :require_admin_company_user, only: [:create, :update, :destroy]

  def index
    if current_user.account_type == 'Company'
      @projects = Project.where(company_id: current_user.account_id)
    elsif current_user.account_type == 'School' && current_user.is_admin
      @projects = current_user.account.contracts.map { |c| c.project }
    else
      @projects = current_user.contracts.map { |c| c.project }
    end

    render json: ProjectSerializer.new(@projects).serialized_json
  end

  def create
    @project = Project.new(project_params)
    @project.company = current_user.account

    if @project.save
      render json: ProjectSerializer.new(@project).serialized_json
    else
      render json: {errors: @project.errors.full_messages}, status: 422
    end
  end

  def show
    if current_user.account_type == 'Company'
      projects = Project.where(company_id: current_user.account_id)
    elsif current_user.account_type == 'School' && current_user.is_admin
      projects = current_user.account.contracts.map { |c| c.project }
    else
      projects = current_user.contracts.map { |c| c.project }
    end

    @project = projects.find(params[:id]).first
    render json: ProjectSerializer.new(@project).serialized_json
  end

  def update
    projects = Project.where(company_id: current_user.account_id)
    @project = projects.find(params[:id])

    if @project.update(project_params)
      render json: ProjectSerializer.new(@project).serialized_json
    else
      render json: {errors: @project.errors.full_messages}, status: 422
    end
  end

  def destroy
    @projects = Project.where(company_id: current_user.account_id)
    @project = @projects.find(params[:id])

    if !@project.contracts.map { |c| c.is_accepted }.include?(true)
      @project.destroy
      render json: ProjectSerializer.new(@projects).serialized_json
    else
      render json: {errors: ["You cannot delete an accepted project"]}, status: 422
    end
  end

  private

  def project_params
    params.permit(:name, :description, :user_stories, :requirements, :is_active)
  end

  def require_login
    unless current_user
      render json: {error: 'No id present on headers'}, status: 404
    end
  end

  def require_admin_company_user
    unless current_user.account_type == 'Company' && current_user.is_admin
      render json: {error: 'Non-school admin account required'}, status: 404
    end
  end
end
