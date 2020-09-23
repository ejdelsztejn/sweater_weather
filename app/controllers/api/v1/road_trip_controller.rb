class Api::V1::RoadTripController < ApplicationController
  def create
    
  end

  def road_trip_params
    params.permit(:origin, :destination, :api_key)
  end
end
