class DailyForecast
  attr_reader :dt,
              :temp,
              :min_temp,
              :max_temp,
              :weather_condition,
              :rain,
              :snow,
              :precipitation

  def initialize(data)
    @dt = data[:dt]
    @temp = data[:temp][:day].round(0)
    @min_temp = data[:temp][:min].round(0)
    @max_temp = data[:temp][:max].round(0)
    @weather_condition = data[:weather].first[:main]
    @rain = (data[:rain] ||= 0)
    @snow = (data[:snow] ||= 0)
    @precipitation = @rain + @snow
  end
end
