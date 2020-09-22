class ForecastService
  def get_forecast_data(latitude, longitude)
    response = conn.get("data/2.5/onecall") do |req|
      req.params[:lat] = latitude
      req.params[:lon] = longitude
      req.params[:exclude] = 'minutely'
      req.params[:units] = 'imperial'
    end

    parse_json(response)
  end

  private

  def conn
    Faraday.new(url: 'https://api.openweathermap.org/') do |req|
     req.params[:appid] = ENV['OPEN_WEATHER_API_KEY']
    end
  end

  def parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
