class Api::V1::ForecastController < ApplicationController
  def index
    require "pry"; binding.pry
    
  end

  def forecast_params
    params.permit(:location)
  end
end
