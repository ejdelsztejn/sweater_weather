require 'rails_helper'

RSpec.describe 'Create a User' do
  describe 'As a visitor,' do
    before(:each) do
      User.destroy_all
    end
    it 'I can register as a user' do
    headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    }

    params = {
      "email": "whatever@example.com",
      "password": "password",
      "password_confirmation": "password"
    }

    post '/api/v1/users', headers: headers, params: JSON.generate(params)

    expect(response).to be_successful
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
  end
end
