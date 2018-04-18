class Api::V1::CompaniesController < ApplicationController
  before_action :require_admin_company_user, only: [:update]

  def index
    @companies = Company.all
    render json: CompanySerializer.new(@companies).serialized_json
  end

  def create
    @company = Company.new(company_params)

    if @company.save
      render json: CompanySerializer.new(@company).serialized_json
    else
      render json: {errors: @company.errors.full_messages}, status: 422
    end
  end

  def show
    @company = Company.find(params[:id])
    render json: CompanySerializer.new(@company).serialized_json
  end

  def show_by_key
    @company = Company.find_by(admin_key: params[:id])
    if @company
      render json: CompanySerializer.new(@company).serialized_json
    else
      @company = Company.find_by(key: params[:id])
      if @company
        render json: CompanySerializer.new(@company).serialized_json
      end
    end
  end

  def update
    @company = Company.find(params[:id])

    if @company.update(company_params)
      render json: CompanySerializer.new(@company).serialized_json
    else
      render json: {errors: @company.errors.full_messages}, status: 422
    end
  end

  private

  def company_params
    params.permit(:name, :website, :description, :key, :admin_key)
  end

  def require_admin_company_user
    unless current_user.account_type == 'Company' && current_user.is_admin
      render json: {error: 'Non-school account required'}, status: 404
    end
  end
end
