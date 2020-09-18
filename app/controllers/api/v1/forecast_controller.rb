class Api::V1::ForecastController < ApplicationController
  def index
    location = forecast_params[:location]
    
  end

  def forecast_params
    params.permit(:location)
  end
end
