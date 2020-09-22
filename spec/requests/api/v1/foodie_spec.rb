require 'rails_helper'

RSpec.describe 'Foodie Endpoints' do
  describe 'As a user, when I visit the landing page,' do
    it 'a get request is made to retrieve a JSON response with data related to the weather, food, and travel distance between two cities' do

      get "/api/v1/foodie?start=denver,co&end=pueblo,co&search=italian"

      expect(response).to be_successful
      expect(response.content_type).to include("application/json")

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json).to have_key(:data)
      expect(json[:data]).to have_key(:id)
      expect(json[:data][:id]).to eq(nil)
      expect(json[:data]).to have_key(:type)
      expect(json[:data][:type]).to eq('foodie')
      expect(json[:data]).to have_key(:attributes)
      expect(json[:data][:attributes]).to include(:end_location)
      expect(json[:data][:attributes]).to include(:travel_time)
      expect(json[:data][:attributes]).to include(:forecast)
      expect(json[:data][:attributes]).to include(:restaurant)

      expect(json[:data][:attributes][:forecast]).to include(:summary)
      expect(json[:data][:attributes][:forecast]).to include(:temperature)
      expect(json[:data][:attributes][:restaurant]).to include(:name)
      expect(json[:data][:attributes][:restaurant]).to include(:address)
    end
  end
end
