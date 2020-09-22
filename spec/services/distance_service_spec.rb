require 'rails_helper'

RSpec.describe DistanceService do
  it 'can return the distance between two locations' do
    distance_service = DistanceService.new
    results = distance_service.get_distance('denver,co', 'pueblo,co')

    expect(results).to be_a(String)
  end

  it 'can return the realtime value for time' do
    distance_service = DistanceService.new
    results = distance_service.get_realtime('denver,co', 'pueblo,co')

    expect(results).to be_a(Integer)
  end
end
