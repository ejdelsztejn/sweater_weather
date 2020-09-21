require 'rails_helper'

describe DailyForecast do
  it 'exists' do
    attrs = {
      dt: 1600692843,
      temp: {
        day: 298.87,
        min: 289.02,
        max: 302.51
      },
      rain: 0.12,
      weather: [{
        main: 'Rain'
    }]
  }

    daily_forecast = DailyForecast.new(attrs)

    expect(daily_forecast).to be_a DailyForecast
    expect(daily_forecast.dt).to eq(1600692843)
    expect(daily_forecast.temp).to eq(299)
    expect(daily_forecast.min_temp).to eq(289)
    expect(daily_forecast.max_temp).to eq(303)
    expect(daily_forecast.weather_condition).to eq('Rain')
    expect(daily_forecast.rain).to eq(0.12)
    expect(daily_forecast.snow).to eq(0)
    expect(daily_forecast.precipitation).to eq(0.12)
  end
end
