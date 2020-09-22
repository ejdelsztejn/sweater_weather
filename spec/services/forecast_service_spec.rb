require 'rails_helper'

RSpec.describe 'ForecastService' do
  it 'can return forecast data by coordinates' do
    forecast_service = ForecastService.new
    data = {
      coordinates: {lat: 55.7558, lng: 37.6173},
      city: "Moscow",
      state: "Moscow"
    }
    results = forecast_service.get_forecast_data(data[:coordinates])
    expect(results).to be_a(Hash)
  end
end
