class HourlyForecast
  attr_reader :dt,
              :temp,
              :summary

  def initialize(data)
    @dt = data[:dt]
    @temp = data[:temp].round(0)
    @summary = data[:weather][0][:main]
  end
end
