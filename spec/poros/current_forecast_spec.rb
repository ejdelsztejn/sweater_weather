require 'rails_helper'

describe CurrentForecast do
  it 'exists' do
    attrs = {
      dt: 1600692843,
      temp: 280.19324,
      feels_like: 279.43282,
      humidity: 71,
      visibility: 10000,
      uvi: 6.67,
      sunrise: 1600692427,
      sunset: 1600736311,
    weather: [{
      main: 'Partly Cloudy'
    }]
  }

    current_forecast = CurrentForecast.new(attrs)

    expect(current_forecast).to be_a CurrentForecast
    expect(current_forecast.dt).to eq(1600692843)
    expect(current_forecast.temp).to eq(280)
    expect(current_forecast.weather_condition).to eq('Partly Cloudy')
    expect(current_forecast.feels_like).to eq(279)
    expect(current_forecast.humidity).to eq(71)
    expect(current_forecast.visibility).to eq(10000)
    expect(current_forecast.uvi).to eq(6.67)
    expect(current_forecast.sunrise).to eq(1600692427)
    expect(current_forecast.sunset).to eq(1600736311)
  end
end
