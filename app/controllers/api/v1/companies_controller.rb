class Api::V1::CompaniesController < ApplicationController
  before_action :require_admin_company_user, only: [:update]

  def index
    @companies = Company.all
    # render json: @companies
    render json: CompanySerializer.new(@companies).serialized_json
  end

  def create
    @company = Company.new(company_params)

    if @company.save
      # render json: @company
      render json: CompanySerializer.new(@company).serialized_json
    else
      render json: {errors: @company.errors.full_messages}, status: 422
    end
  end

  def show
    @company = Company.find(params[:id])
    # render json: @company
    render json: CompanySerializer.new(@company).serialized_json
  end

  def update
    @company = Company.find(params[:id])

    if @company.update(company_params)
      # render json: @company
      render json: CompanySerializer.new(@company).serialized_json
    else
      render json: {errors: @company.errors.full_messages}, status: 422
    end
  end

  private

  def company_params
    params.permit(:name, :website, :description)
  end

  def require_admin_company_user
    unless current_user.account_type == 'Company' && current_user.is_admin
      render json: {error: 'Non-school account required'}, status: 404
    end
  end
end
