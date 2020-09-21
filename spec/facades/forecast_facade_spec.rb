require 'rails_helper'

RSpec.describe ForecastFacade do
  before(:each) do
    coordinates = {lat: 64.1814, lng: 51.6941}
    @forecast_facade = ForecastFacade.new(coordinates)
  end

  it '#forecast_data' do
    forecast = @forecast_facade.forecast_data
    expect(forecast).to be_a(Hash)
  end

  it '#current_forecast' do
    forecast = @forecast_facade.current_forecast
    expect(forecast).to be_a(CurrentForecast)
  end

  it '#daily_forecast' do
    forecast = @forecast_facade.daily_forecast
    expect(forecast).to be_a(Array)
  end

  it '#hourly_forecast' do
    forecast = @forecast_facade.hourly_forecast
    expect(forecast).to be_a(Array)
  end
end
