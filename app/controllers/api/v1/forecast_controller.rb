class Api::V1::ForecastController < ApplicationController
  def index
    location = forecast_params[:location]

    geocoding_facade = GeocodingFacade.new(location)
    lat_long = geocoding_facade.find_lat_long
  end

  def forecast_params
    params.permit(:location)
  end
end
