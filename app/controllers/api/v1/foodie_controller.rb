class Api::V1::FoodieController < ApplicationController
  def index
    
  end

  private

  def foodie_params
    params.permit(:start, :end, :search)
  end
end
