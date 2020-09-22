class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :get_location, :current_forecast, :daily_forecast, :hourly_forecast
end
