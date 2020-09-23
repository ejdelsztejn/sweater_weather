class Api::V1::RoadTripController < ApplicationController
  def create
    conn = Faraday.new(url: 'http://www.mapquestapi.com')
    response = conn.get("/directions/v2/route?key=#{ENV['MAPQUEST_API_KEY']}&from=#{road_trip_params[:origin]}&to=#{road_trip_params[:destination]}")
    json = JSON.parse(response.body, symbolize_names: true)
    require "pry"; binding.pry
  end

  def road_trip_params
    params.permit(:origin, :destination, :api_key)
  end
end
