# Sweater Weather

*Sweater Weather* is a backend Rails API for a fictional weather & trip planning app that connects to the **Mapquest**, **Open Weather**, and **Pixabay** exernal APIs.

This project was completed during the end of Module 3 of the Backend Engineering Program at Turing School which focuses on building and consuming API's.

- [Original Project Page](https://backend.turing.io/module3/projects/sweater_weather/)
- [Technical Requirements](https://backend.turing.io/module3/projects/sweater_weather/requirements)

### Versions

- Ruby 2.5.3
- Rails 6.0.3
- PostgreSQL database
- RSpec for testing

### Setup

1. Fork & clone the repo
2. Run `bundle install`
3. Run `rails db:{create,migrate}`
4. Run `bundle exec figaro install`
5. Add your API keys to the newly created `config/application.yml` file. Reference the **API Keys** section below for compatible environment variable key naming.
6. To run local test suite: `bundle exec rspec`


### API Keys

Add these to your `application.yml` file:

[Mapquest API](https://developer.mapquest.com/documentation/geocoding-api/)
`GEOCODING_API_KEY: <api_key>`

[Open Weather API](https://openweathermap.org/api/one-call-api)
`OPEN_WEATHER_API_KEY: <api_key>`

[Pixabay API](https://pixabay.com/service/about/api/)
`PIXABAY_API_KEY: <api_key>`

### Check it out!

- Spin up a local server for *Sweater Weather* before trying to run the requests in Postman
- From the project directory, run `rails s`
- The Postman collection below uses `http://localhost:3000` as the base domain
