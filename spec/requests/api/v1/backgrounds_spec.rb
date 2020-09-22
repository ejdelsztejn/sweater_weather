require 'rails_helper'

RSpec.describe 'Background Endpoints' do
  describe 'As a user, when I visit the landing page' do
    it 'a get request is made to fetch a background image for that page showing the city' do
      VCR.use_cassette('get_image_data') do
        get '/api/v1/backgrounds?location=denver,co'
        expect(response).to be_successful
        expect(response.content_type).to include("application/json")

        json = JSON.parse(response.body, symbolize_names: true)

        expect(json).to have_key(:data)
        expect(json[:data]).to have_key(:type)
        expect(json[:data][:type]).to eq('image')
        expect(json[:data]).to have_key(:id)
        expect(json[:data][:id]).to eq(nil)
        expect(json[:data]).to have_key(:attributes)
        expect(json[:data][:attributes][:image]).to have_key(:location)
        expect(json[:data][:attributes][:image]).to have_key(:image_url)
        expect(json[:data][:attributes][:image]).to have_key(:credit)
        expect(json[:data][:attributes][:image][:credit]).to have_key(:source)
        expect(json[:data][:attributes][:image][:credit]).to have_key(:author)
        expect(json[:data][:attributes][:image][:credit]).to have_key(:logo)
      end
    end
    it 'returns an error when no location given' do
      get '/api/v1/backgrounds?location='
      expect(response).to_not be_successful
      expect(response.content_type).to include("application/json")

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json).to have_key(:error)
      expect(json[:error]).to have_key(:message)
      expect(json[:error][:message]).to eq('Location required')
    end
  end
end
