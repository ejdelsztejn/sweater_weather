require 'rails_helper'

RSpec.describe 'GeocodingService' do
  it 'can return data by location' do
    location_service = GeocodingService.new
    results = location_service.get_location_data('denver,co')

    expect(results).to be_a(Hash)
  end
end
