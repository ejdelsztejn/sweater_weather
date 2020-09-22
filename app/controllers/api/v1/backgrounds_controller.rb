class Api::V1::BackgroundsController < ApplicationController
  def index
    render json: ImageSerializer.new(ForecastFacade.new(background_params[:location]))
  end

  private

  def background_params
    params.permit(:location)
  end
end
