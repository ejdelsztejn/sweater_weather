require 'rails_helper'

RSpec.describe 'ForecastService' do
  it 'can return forecast data by coordinates' do
    forecast_service = ForecastService.new
    latitude = 64.1814
    longitude = 51.6941
    results = forecast_service.get_forecast_data(latitude, longitude)
    expect(results).to be_a(Hash)
  end
end
