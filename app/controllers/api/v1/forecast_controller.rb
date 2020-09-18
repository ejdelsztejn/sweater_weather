class Api::V1::ForecastController < ApplicationController
  def index
    location = forecast_params[:location]

    conn = Faraday.new('http://www.mapquestapi.com')

    response = conn.get("/geocoding/v1/address?key=#{ENV['MAPQUEST_API_KEY']}&location=#{location}")

    json = JSON.parse(response.body, symbolize_names: true)

    lat_long = json[:results].first[:locations].first[:latLng]]

    geocoding_facade = GeocodingFacade.new(location)
    lat_long = geocoding_facade.find_lat_long
  end

  def forecast_params
    params.permit(:location)
  end
end
