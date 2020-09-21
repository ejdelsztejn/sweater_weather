class HourlyForecast
  attr_reader :dt,
              :temp

  def initialize(data)
    @dt = data[:dt]
    @temp = data[:temp].round(0)
  end
end
