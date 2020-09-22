class Api::V1::ForecastController < ApplicationController
  def index
    render json: ForecastSerializer.new(ForecastFacade.new(forecast_params[:location]))
  end

  def forecast_params
    params.permit(:location)
  end
end
