require 'rails_helper'

describe DailyForecast do
  it 'exists' do
    attrs = {
      dt: 1600692843,
      temp: 298.87,
    }

    hourly_forecast = HourlyForecast.new(attrs)

    expect(hourly_forecast).to be_a HourlyForecast
    expect(hourly_forecast.dt).to eq(1600692843)
    expect(hourly_forecast.temp).to eq(299)
  end
end
