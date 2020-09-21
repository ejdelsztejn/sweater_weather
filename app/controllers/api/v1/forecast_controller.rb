class Api::V1::ForecastController < ApplicationController
  def index
    coordinates = get_coordinates(forecast_params[:location])

    conn = Faraday.new(url: 'https://api.openweathermap.org')
    response = conn.get("/data/2.5/onecall?lat=#{coordinates[:lat]}&lon=#{coordinates[:lng]}&
&appid=#{ENV['OPEN_WEATHER_API_KEY']}")
    json = JSON.parse(response.body, symbolize_names: true)
    current_forecast_info = json[:current]
    # require "pry"; binding.pry
    current_forecast = CurrentForecast.new(current_forecast_info)

  end

  def get_coordinates(location)
    geocoding_facade = GeocodingFacade.new(location)
    geocoding_facade.find_lat_long
  end

  def forecast_params
    params.permit(:location)
  end
end
