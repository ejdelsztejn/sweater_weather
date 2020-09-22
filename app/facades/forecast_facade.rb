class ForecastFacade
  attr_reader :id,
              :latitude,
              :longitude,
              :service

  def initialize(coordinates)
    @latitude  = coordinates[:lat]
    @longitude = coordinates[:lng]
    @service ||= ForecastService.new
  end

  def forecast_data
    service.get_forecast_data(latitude, longitude)
  end

  def current_forecast
    current_forecast_info = forecast_data[:current]

    CurrentForecast.new(current_forecast_info)
  end

  def daily_forecast
    daily_forecast_info = forecast_data[:daily].take(6)

    daily_forecast_info.map do |forecast|
      DailyForecast.new(forecast)
    end
  end

  def hourly_forecast
    hourly_forecast_info = forecast_data[:hourly].take(8)
    hourly_forecast_info.map do |forecast|
      HourlyForecast.new(forecast)
    end
  end
end
