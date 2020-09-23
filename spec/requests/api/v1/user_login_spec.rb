require 'rails_helper'

RSpec.describe 'Log In a User' do
  describe 'As a user,' do
    before(:each) do
      @user = User.create!(email: "whatever@example.com", password: "password")
    end
    it 'I can login' do
      headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      }

      params = {
        "email": "whatever@example.com",
        "password": "password"
      }

      post '/api/v1/sessions', headers: headers, params: JSON.generate(params)

      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(response.content_type).to include("application/json")

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json).to have_key(:data)
      expect(json[:data]).to have_key(:id)
      expect(json[:data][:id]).to_not eq(nil)
      expect(json[:data][:id]).to be_a(String)
      expect(json[:data]).to have_key(:type)
      expect(json[:data][:type]).to eq('users')
      expect(json[:data]).to have_key(:attributes)
      expect(json[:data][:attributes]).to include(:email)
      expect(json[:data][:attributes]).to include(:api_key)
      expect(json[:data][:attributes]).to_not include(:password)
      expect(json[:data][:attributes]).to_not include(:password_digest)
    end
    it 'if user email cannot be found, an error is thrown' do
      headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      }

      params = {
        "email": "whomever@example.com",
        "password": "password123"
      }

      post '/api/v1/sessions', headers: headers, params: JSON.generate(params)

      expect(response).to_not be_successful
      expect(response.status).to eq(401)
      expect(response.content_type).to include("application/json")

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json).to_not have_key(:data)
      expect(json).to have_key(:error)
      expect(json[:error]).to have_key(:message)
      expect(json[:error][:message]).to eq('Bad credentials')
    end
  end
end
