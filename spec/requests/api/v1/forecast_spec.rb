require 'rails_helper'

RSpec.describe 'Forecast Endpoints' do
  describe 'As a user, when I visit the landing page,' do
    it 'a get request is made to retrieve a JSON response with data related to the weather in Denver' do

      get '/api/v1/forecast?location=denver,co'
      expect(response).to be_successful
      expect(response.content_type).to include("application/json")

      forecast = JSON.parse(response.body, symbolize_names: true)

      expect(forecast).to be_a(Hash)
      expect(forecast).to have_key(:data)
      expect(forecast[:data]).to have_key(:id)
      expect(forecast[:data][:id]).to eq(nil)
      expect(forecast[:data]).to have_key(:type)
      expect(forecast[:data][:type]).to eq('forecast')
      expect(forecast[:data]).to have_key(:attributes)
      expect(forecast[:data][:attributes]).to include(:current_forecast)
      expect(forecast[:data][:attributes]).to include(:daily_forecast)
      expect(forecast[:data][:attributes]).to include(:hourly_forecast)

      expect(forecast[:data][:attributes][:current_forecast]).to include(:dt)
      expect(forecast[:data][:attributes][:current_forecast]).to include(:temp)
      expect(forecast[:data][:attributes][:current_forecast]).to include(:weather_condition)
      expect(forecast[:data][:attributes][:current_forecast]).to include(:feels_like)
      expect(forecast[:data][:attributes][:current_forecast]).to include(:humidity)
      expect(forecast[:data][:attributes][:current_forecast]).to include(:visibility)
      expect(forecast[:data][:attributes][:current_forecast]).to include(:uvi)
      expect(forecast[:data][:attributes][:current_forecast]).to include(:sunrise)
      expect(forecast[:data][:attributes][:current_forecast]).to include(:sunset)

      forecast[:data][:attributes][:daily_forecast].each do |forecast|
        expect(forecast).to include(:dt)
        expect(forecast).to include(:temp)
        expect(forecast).to include(:min_temp)
        expect(forecast).to include(:max_temp)
        expect(forecast).to include(:rain)
        expect(forecast).to include(:snow)
        expect(forecast).to include(:precipitation)
        expect(forecast).to include(:weather_condition)
      end

      forecast[:data][:attributes][:hourly_forecast].each do |forecast|
        expect(forecast).to include(:dt)
        expect(forecast).to include(:temp)
      end
    end
  end
end
