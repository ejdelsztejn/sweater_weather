class Api::V1::FoodieController < ApplicationController
  def index
    distance_service = DistanceService.new
    distance_service.get_distance(foodie_params[:start], foodie_params[:end])
    forecast = ForecastFacade.new(foodie_params[:end])
    coordinates = forecast.get_location[:coordinates]

    conn = Faraday.new(url: 'https://developers.zomato.com') do |req|
      req.params[:apikey] = ENV['ZOMATO_API_KEY']
    end
    response = conn.get("/api/v2.1/search?lat=#{coordinates[:lat]}&lon=#{coordinates[:lng]}&cuisines=#{foodie_params[:search]}")
    json = JSON.parse(response.body, symbolize_names: true)
    restaurant = json[:restaurants].find do |restaurant|
      restaurant[:restaurant][:cuisines].include?(foodie_params[:search].capitalize)
    end
  end

  private

  def foodie_params
    params.permit(:start, :end, :search)
  end
end
