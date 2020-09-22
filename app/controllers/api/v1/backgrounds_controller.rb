class Api::V1::BackgroundsController < ApplicationController
  def index
    if background_params[:location].nil? || background_params[:location].empty?
      render json: { 'error': {'message': 'Location required' }}, status: 400
    else
      render json: ImageSerializer.new(ForecastFacade.new(background_params[:location])), status: 200
    end
  end

  private

  def background_params
    params.permit(:location)
  end
end
