class Api::V1::ForecastController < ApplicationController
  def index
    coordinates = get_coordinates(forecast_params[:location])

    conn = Faraday.new(url: 'https://api.openweathermap.org')
    response = conn.get("/data/2.5/onecall?lat=#{coordinates[:lat]}&lon=#{coordinates[:lng]}&
&appid=#{ENV['OPEN_WEATHER_API_KEY']}")
    json = JSON.parse(response.body, symbolize_names: true)
    require "pry"; binding.pry

    info = [
    # General Info

    # City

    # Country

    # Current time

    # Current Date
    json[:current][:dt],
    # Weather Condition (ex: "Partly Cloudy")

    # Current temperature in F

    # High in F

    # Low in F

    # Feels like
    json[:current][:feels_like],
    # Humidity
    json[:current][:humidity],
    # Visbility
    json[:current][:visibility],
    # UV Index
    json[:current][:uvi],
    # Weather Condition (ex: "Partly Cloudy")

    # Time of Sunrise
    json[:current][:sunrise],
    # Time of Sunset
    json[:current][:sunset],
  ]
  end

  def get_coordinates(location)
    geocoding_facade = GeocodingFacade.new(location)
    geocoding_facade.find_lat_long
  end

  def forecast_params
    params.permit(:location)
  end
end
