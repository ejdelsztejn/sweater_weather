require 'rails_helper'

RSpec.describe 'Create a User' do
  describe 'As a visitor,' do
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
    end
  end
end
