require 'rails_helper'

RSpec.describe 'GeocodingService' do
  it 'can return data by location' do
    location_service = GeocodingService.new
    results = location_service.location_data('denver,co')

    expect(results).to be_a(Array)
  end
end
