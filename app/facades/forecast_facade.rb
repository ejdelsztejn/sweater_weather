class ForecastFacade
  attr_reader :id,
              # :latitude,
              # :longitude,
              :forecast_service,
              :geocoding_service,
              :location

  def initialize(location)
    # @latitude            = coordinates[:lat]
    # @longitude           = coordinates[:lng]
    @geocoding_service ||= GeocodingService.new
    @forecast_service  ||= ForecastService.new
    @location            = location
  end

  def get_location
    data = geocoding_service.get_location_data(location)
    {
      coordinates: data[:results].first[:locations].first[:latLng],
      city: data[:results].first[:locations].first[:adminArea5],
      state: data[:results].first[:locations].first[:adminArea3]
    }
  end

  def forecast_data
    forecast_service.get_forecast_data(get_location[:coordinates])
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
