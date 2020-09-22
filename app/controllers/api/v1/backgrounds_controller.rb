class Api::V1::BackgroundsController < ApplicationController
  def index
    conn = Faraday.new("https://pixabay.com/api") do |req|
      req.params["key"] = ENV["PIXABAY_API_KEY"]
    end
    response = conn.get do |req|
      req.params[:q] = background_params[:location]
    end
    require "pry"; binding.pry
  end

  private

  def background_params
    params.permit(:location)
  end
end
