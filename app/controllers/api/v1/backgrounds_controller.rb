class Api::V1::BackgroundsController < ApplicationController
  def index
    city = background_params[:location].split(',')[0]

  end

  private

  def background_params
    params.permit(:location)
  end
end
