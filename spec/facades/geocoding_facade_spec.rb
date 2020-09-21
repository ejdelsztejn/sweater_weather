require 'rails_helper'

RSpec.describe GeocodingFacade do
  before(:each) do
    @geocoding_facade = GeocodingFacade.new('denver,co')
  end

  it '#find_lat_long' do
    geocoding = @geocoding_facade.find_lat_long
    expect(geocoding).to be_a(Hash)
    expect(geocoding[:lat]).to eq(39.738453)
    expect(geocoding[:lng]).to eq(-104.984853)
  end
end
