class Api::V1::ForecastController < ApplicationController
  def index

  end

  def forecast_params
    params.permit(:location)
  end
end
