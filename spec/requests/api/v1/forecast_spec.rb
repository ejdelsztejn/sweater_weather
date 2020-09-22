require 'rails_helper'

RSpec.describe 'Forecast Endpoints' do
  describe 'As a user, when I visit the landing page,' do
    it 'a get request is made to retrieve a JSON response with data related to the weather in Denver' do

      get '/api/v1/forecast?location=denver,co'
      expect(response).to be_successful
      expect(response.content_type).to eq("application/json")
      
    end
  end
end
