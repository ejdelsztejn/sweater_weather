class ForecastService
  def get_forecast_data(latitude, longitude)
    response = conn.get("/data/2.5/onecall?lat=#{latitude}&lon=#{longitude}&
    &appid=#{ENV['OPEN_WEATHER_API_KEY']}")
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def conn
    conn = Faraday.new(url: 'https://api.openweathermap.org')
  end
end
