require 'rails_helper'

RSpec.describe 'Geocoding Facade' do
  before(:each) do
    @geocoding_facade = GeocodingFacade.new('denver,co')
  end

  it '#get_location_data' do
    geocoding = @geocoding_facade.get_location_data
    expect(geocoding.content_type).to eq("application/json")
  end

  it '#find_lat_long' do
    geocoding = @geocoding_facade.find_lat_long
    expect(geocoding).to be_a(Hash)
    expect(geocoding[:lat]).to eq(39.738453)
    expect(geocoding[:lng]).to eq(-104.984853)
  end
end
