class Api::V1::ForecastController < ApplicationController
  def index
    lat_long = get_lat_long(forecast_params[:location])
  end

  def get_lat_long(location)
    geocoding_facade = GeocodingFacade.new(location)
    lat_long = geocoding_facade.find_lat_long
  end

  def forecast_params
    params.permit(:location)
  end
end
