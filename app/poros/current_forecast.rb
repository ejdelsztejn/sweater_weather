class CurrentForecast
  attr_reader :dt,
              :temp,
              :weather_condition,
              :feels_like,
              :humidity,
              :visibility,
              :uvi,
              :sunrise,
              :sunset,
              :description

  def initialize(data)
    @dt = data[:current][:dt]
    @temp = data[:current][:temp].round(0)
    @weather_condition = data[:current][:weather].first[:main]
    @feels_like = data[:current][:feels_like].round(0)
    @humidity = data[:current][:humidity]
    @visibility = data[:current][:visibility]
    @uvi = data[:current][:uvi]
    @sunrise = data[:current][:sunrise]
    @sunset = data[:current][:sunset]
    @description = data[:current][:weather].first[:main]
  end
end
