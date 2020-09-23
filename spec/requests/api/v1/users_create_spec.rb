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
      expect(response.status).to eq(201)
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

    it 'if email is invalid, an error is thrown' do
      headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      }

      params = {
        "email": "fadffdafdfda",
        "password": "password",
        "password_confirmation": "password"
      }

      post '/api/v1/users', headers: headers, params: JSON.generate(params)

      expect(response.status).to eq(400)

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json).to_not have_key(:data)
      expect(json).to have_key(:error)
      expect(json[:error]).to have_key(:message)
      expect(json[:error][:message]).to eq('Valid email address required')
    end
    it 'if passwords do not match, an error is thrown' do
      headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      }

      params = {
        "email": "email@email.com",
        "password": "passwordd",
        "password_confirmation": "password"
      }

      post '/api/v1/users', headers: headers, params: JSON.generate(params)

      expect(response.status).to eq(400)

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json).to_not have_key(:data)
      expect(json).to have_key(:error)
      expect(json[:error]).to have_key(:message)
      expect(json[:error][:message]).to eq('Password and password confirmation must match')
    end
    it 'if an email is already taken, an error is thrown' do
      headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      }

      params = {
        "email": "whatever@example.com",
        "password": "password",
        "password_confirmation": "password"
      }

      user = User.create!(params)

      post '/api/v1/users', headers: headers, params: JSON.generate(params)

      expect(response.status).to eq(400)

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json).to_not have_key(:data)
      expect(json).to have_key(:error)
      expect(json[:error]).to have_key(:message)
      expect(json[:error][:message]).to eq('Email is already taken')
    end
    it 'if email field is blank, an error is thrown' do
      headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      }

      params = {
        "email": "",
        "password": "password",
        "password_confirmation": "password"
      }

      post '/api/v1/users', headers: headers, params: JSON.generate(params)

      expect(response.status).to eq(400)

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json).to_not have_key(:data)
      expect(json).to have_key(:error)
      expect(json[:error]).to have_key(:message)
      expect(json[:error][:message]).to eq('Fields cannot be blank')
    end
    it 'if the password field is empty, an error is thrown' do
      headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      }

      params = {
        "email": "whatever@example.com",
        "password": "",
        "password_confirmation": "password"
      }

      post '/api/v1/users', headers: headers, params: JSON.generate(params)

      expect(response.status).to eq(400)

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json).to_not have_key(:data)
      expect(json).to have_key(:error)
      expect(json[:error]).to have_key(:message)
      expect(json[:error][:message]).to eq('Fields cannot be blank')
    end
    it 'if the password confirmation field is empty, an error is thrown' do
      headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      }

      params = {
        "email": "whatever@example.com",
        "password": "password",
        "password_confirmation": ""
      }

      post '/api/v1/users', headers: headers, params: JSON.generate(params)

      expect(response.status).to eq(400)

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json).to_not have_key(:data)
      expect(json).to have_key(:error)
      expect(json[:error]).to have_key(:message)
      expect(json[:error][:message]).to eq('Fields cannot be blank')
    end
  end
end
