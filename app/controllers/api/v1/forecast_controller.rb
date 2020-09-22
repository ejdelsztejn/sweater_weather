class Api::V1::ForecastController < ApplicationController
  def index
    # coordinates = get_coordinates(forecast_params[:location])
    forecast = ForecastFacade.new(forecast_params[:location])

    render json: ForecastSerializer.new(forecast)
  end

  def get_coordinates(location)
    geocoding_facade = GeocodingFacade.new(location)
    geocoding_facade.find_lat_long
  end

  def forecast_params
    params.permit(:location)
  end
end
