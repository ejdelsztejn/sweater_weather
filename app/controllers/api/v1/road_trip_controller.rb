class Api::V1::RoadTripController < ApplicationController
  def create
    start_place, end_place = road_trip_params[:origin], road_trip_params[:destination]
    render json: RoadTripSerializer.new(RoadTripFacade.new(start_place, end_place).get_trip_details)
  end

  def road_trip_params
    params.permit(:origin, :destination, :api_key)
  end
end
