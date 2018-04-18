class Api::V1::ContractsController < ApplicationController
  before_action :require_login
  before_action :require_school_user, only: [:update]
  before_action :require_admin_company_user, only: [:create, :destroy]

  def index
    if current_user.account_type == 'Company'
      projects = Project.where(company_id: current_user.account_id)
      @contracts = projects.map { |p| p.contracts }
      @contracts.flatten!
    elsif current_user.account_type == 'School' && current_user.is_admin
      @contracts = current_user.account.contracts
    else
      @contracts = current_user.contracts
    end

    render json: ContractSerializer.new(@contracts).serialized_json
  end

  def create
    @contract = Contract.new(new_contract_params)
    school = School.find(new_contract_params[:school_id])
    @contract.fee = school.fee

    if @contract.save
      render json: ContractSerializer.new(@contract).serialized_json
    else
      render json: {errors: @contract.errors.full_messages}, status: 422
    end
  end

  def show
    if current_user.account_type == 'Company'
      projects = Project.where(company_id: current_user.account_id)
      contracts = Contract.where(project_id: projects.ids)
    elsif current_user.account_type == 'School' && current_user.is_admin
      contracts = current_user.account.contracts
    else
      contracts = current_user.contracts
    end

    @contract = contracts.find(params[:id]) # I think is fine
    render json: ContractSerializer.new(@contract).serialized_json
  end

  def update
    if current_user.is_admin
      contracts = current_user.account.contracts
    else
      contracts = current_user.contracts
    end

    @contract = contracts.find(params[:id]) # I think is fine

    if @contract.update(update_contract_params)
      render json: ContractSerializer.new(@contract).serialized_json
    else
      render json: {errors: @contract.errors.full_messages}, status: 422
    end
  end

  def destroy
    projects = Project.where(company_id: current_user.account_id)
    @contracts = Contract.where(project_id: projects.ids)
    @contract = @contracts.find(params[:id]).first # I think is fine

    if !@contract.is_accepted
      @contract.destroy
      render json: ContractSerializer.new(@contracts).serialized_json
    else
      render json: {errors: ["You cannot cancel an accepted request"]}, status: 422
    end
  end

  private

  def new_contract_params
    params.permit(:school_id, :project_id)
  end

  def update_contract_params
    params.permit(:user_id, :github, :is_requested, :is_accepted, :is_in_progress, :is_in_review, :is_completed)
  end

  def require_login
    unless current_user
      render json: {error: 'No id present on headers'}, status: 404
    end
  end

  def require_school_user
    unless current_user.account_type == 'School'
      render json: {error: 'School account required'}, status: 404
    end
  end

  def require_admin_company_user
    unless current_user.account_type == 'Company' && current_user.is_admin
      render json: {error: 'Non-school account required'}, status: 404
    end
  end
end
