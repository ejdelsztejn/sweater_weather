require 'rails_helper'

RSpec.describe ForecastFacade do
  before(:each) do
    # VCR.use_cassette('all_forecast_data') do
      location = 'denver,co'
      @forecast_facade = ForecastFacade.new(location)
    # end
  end
  #
  # it '#forecast_data' do
  #   VCR.use_cassette('all_forecast_data') do
  #     forecast = @forecast_facade.forecast_data
  #     expect(forecast).to be_a(Hash)
  #   end
  # end
  #
  # it '#current_forecast' do
  #   VCR.use_cassette('all_forecast_data') do
  #     forecast = @forecast_facade.current_forecast
  #     expect(forecast).to be_a(CurrentForecast)
  #   end
  # end
  #
  # it '#daily_forecast' do
  #   VCR.use_cassette('all_forecast_data') do
  #     forecast = @forecast_facade.daily_forecast
  #     expect(forecast).to be_a(Array)
  #   end
  # end
  #
  # it '#hourly_forecast' do
  #   VCR.use_cassette('all_forecast_data') do
  #     forecast = @forecast_facade.hourly_forecast
  #     expect(forecast).to be_a(Array)
  #   end
  # end

  it '#image' do
    @forecast_facade.image
  end
end
