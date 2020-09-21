class ForecastFacade
  attr_reader :latitude,
              :longitude

  def initialize(coordinates)
    @latitude  = coordinates[:lat]
    @longitude = coordinates[:lng]
  end

  def get_forecast_data
    conn = Faraday.new(url: 'https://api.openweathermap.org')
    response = conn.get("/data/2.5/onecall?lat=#{latitude}&lon=#{longitude}&
    &appid=#{ENV['OPEN_WEATHER_API_KEY']}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def current_forecast
    current_forecast_info = get_forecast_data[:current]

    CurrentForecast.new(current_forecast_info)
  end

  def daily_forecast
    daily_forecast_info = get_forecast_data[:daily].take(6)

    daily_forecast_info.map do |forecast|
      DailyForecast.new(forecast)
    end
  end
end
