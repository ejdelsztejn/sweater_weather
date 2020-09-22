class Api::V1::FoodieController < ApplicationController
  def index
    conn = Faraday.new(url: 'http://www.mapquestapi.com')
    response = conn.get("/directions/v2/route?key=#{ENV['MAPQUEST_API_KEY']}&from=#{foodie_params[:start]}&to=#{foodie_params[:end]}")
    json = JSON.parse(response.body, symbolize_names: true)
  end

  private

  def foodie_params
    params.permit(:start, :end, :search)
  end
end
