class Api::V1::RoadTripController < ApplicationController
  def create
    RoadTripFacade.new(road_trip_params[:origin], road_trip_params[:destination])
  end

  def road_trip_params
    params.permit(:origin, :destination, :api_key)
  end
end
