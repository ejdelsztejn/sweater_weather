require 'rails_helper'

RSpec.describe 'Road Trip Endpoints' do
  describe 'As a user, when I visit the landing page,' do
    before(:each) do
      @user = User.create!(email: "whatever@example.com", password: "password")
    end
    it 'a get request is made to retrieve a JSON response with data related to the weather and travel distance between two cities' do
      headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      }

      params = {
        "origin": "Denver,CO",
        "destination": "Pueblo,CO",
        "api_key": @user.api_key
      }

      post '/api/v1/road_trip', headers: headers, params: JSON.generate(params)

      expect(response).to be_successful
      expect(response.content_type).to include("application/json")

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json).to have_key(:data)
      expect(json[:data]).to have_key(:id)
      expect(json[:data][:id]).to eq(nil)
      expect(json[:data]).to have_key(:type)
      expect(json[:data][:type]).to eq('road_trip')
      expect(json[:data]).to have_key(:attributes)
      expect(json[:data][:attributes]).to include(:origin)
      expect(json[:data][:attributes]).to include(:destination)
      expect(json[:data][:attributes]).to include(:travel_time)
      expect(json[:data][:attributes]).to include(:forecast)

      expect(json[:data][:attributes][:forecast]).to include(:summary)
      expect(json[:data][:attributes][:forecast]).to include(:temperature)

      expect(json[:data][:attributes][:forecast]).to_not include(:dt)
    end
    it 'if incorrect API key is sent, an error is thrown' do
      headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      }

      params = {
        "origin": "Denver,CO",
        "destination": "Pueblo,CO",
        "api_key": '43kj454kj'
      }

      post '/api/v1/road_trip', headers: headers, params: JSON.generate(params)

      expect(response).to_not be_successful
      expect(response.content_type).to include("application/json")
      expect(response.status).to eq(401)

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json).to_not have_key(:data)
      expect(json).to have_key(:error)
      expect(json[:error]).to have_key(:message)
      expect(json[:error][:message]).to eq('Correct API Key required')
    end
    it 'if no API key is sent, an error is thrown' do
      headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      }

      params = {
        "origin": "Denver,CO",
        "destination": "Pueblo,CO",
        "api_key": ''
      }

      post '/api/v1/road_trip', headers: headers, params: JSON.generate(params)

      expect(response).to_not be_successful
      expect(response.content_type).to include("application/json")
      expect(response.status).to eq(401)

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json).to_not have_key(:data)
      expect(json).to have_key(:error)
      expect(json[:error]).to have_key(:message)
      expect(json[:error][:message]).to eq('Correct API Key required')
    end
  end
end
