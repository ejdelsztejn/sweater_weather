class Api::V1::RoadTripController < ApplicationController
  def create
    distance_service = DistanceService.new
    distance = distance_service.get_distance(road_trip_params[:origin], road_trip_params[:destination])
    require "pry"; binding.pry
  end

  def road_trip_params
    params.permit(:origin, :destination, :api_key)
  end
end
