class Api::V1::BackgroundsController < ApplicationController
  def index
    city = background_params[:location].split(',')[0]

    conn = Faraday.new("https://pixabay.com/api/") do |req|
      req.params["key"] = ENV["PIXABAY_API_KEY"]
    end
    response = conn.get do |req|
      req.params[:q] = city
    end
    json = JSON.parse(response.body, symbolize_names: true)
    require "pry"; binding.pry
  end

  private

  def background_params
    params.permit(:location)
  end
end
