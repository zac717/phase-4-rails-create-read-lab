class PlantsController < ApplicationController

  # To disable the wrap feature
  wrap_parameters format:[]

  # GET /plants
  def index
      plants = Plant.all
      render json: plants, except: [:created_at, :updated_at]
  end

  # GET /plants/:id
  def show
      plant = Plant.find(params[:id])
      render json: plant
  end

  # POST /plants
  def create
      plant = Plant.create(plant_params)
      render json: plant, status: :created
  end

  # everything after this is private
  private

  def plant_params
      params.permit(:name, :image, :price)
  end

end
