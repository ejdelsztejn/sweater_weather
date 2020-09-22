class Api::V1::FoodieController < ApplicationController
  def index
    render json: FoodieSerializer.new(FoodieResultsFacade.new(foodie_params[:start], foodie_params[:end], foodie_params[:search]))
  end

  private

  def foodie_params
    params.permit(:start, :end, :search)
  end
end
