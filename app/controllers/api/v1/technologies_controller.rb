class Api::V1::TechnologiesController < ApplicationController
  def index
    @technologies = Technology.all
    render json: TechnologySerializer.new(@technologies).serialized_json
  end

  def create
    @technology = Technology.new(technology_params)

    if @technology.save
      render json: TechnologySerializer.new(@technology).serialized_json
    else
      render json: {errors: @technology.errors.full_messages}, status: 422
    end
  end

  def show
    @technology = Technology.find(params[:id])
    render json: TechnologySerializer.new(@technology).serialized_json
  end

  def update
    @technology = Technology.find(params[:id])

    if @technology.update(technology_params)
      render json: TechnologySerializer.new(@technology).serialized_json
    else
      render json: {errors: @technology.errors.full_messages}, status: 422
    end
  end

  private

  def technology_params
    params.permit(:name)
  end
end
