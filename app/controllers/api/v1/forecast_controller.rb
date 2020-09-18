class Api::V1::ForecastController < ApplicationController
  def index
    location = forecast_params[:location]

    conn = Faraday.new('http://www.mapquestapi.com')

    require "pry"; binding.pry
  end

  def forecast_params
    params.permit(:location)
  end
end
