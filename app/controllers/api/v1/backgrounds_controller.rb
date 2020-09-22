class Api::V1::BackgroundsController < ApplicationController
  def index
  end

  private

  def background_params
    params.permit(:location)
  end
end
