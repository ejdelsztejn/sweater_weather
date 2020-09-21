class CurrentForecast
  attr_reader :dt,
              :temp,
              :weather_condition,
              :feels_like,
              :humidity,
              :visibility,
              :uvi,
              :sunrise,
              :sunset

  def initialize(data)
    @dt = data[:dt]
    @temp = data[:temp].round(0)
    @weather_condition = data[:weather].first[:main]
    @feels_like = data[:feels_like].round(0)
    @humidity = data[:humidity]
    @visibility = data[:visibility]
    @uvi = data[:uvi]
    @sunrise = data[:sunrise]
    @sunset = data[:sunset]
  end
end
