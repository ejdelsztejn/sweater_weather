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
      
    end
  end
end
