class Api::V1::RoadTripController < ApplicationController
  def create
    start_place, end_place = road_trip_params[:origin], road_trip_params[:destination]
    if User.find_by(api_key: road_trip_params[:api_key]).nil? == false
      render json: RoadTripSerializer.new(RoadTripFacade.new(start_place, end_place).get_trip_details)
    else
      render json: { 'error': {'message': 'Correct API Key required' }}, status: 401
    end
  end

  def road_trip_params
    params.permit(:origin, :destination, :api_key)
  end
end
