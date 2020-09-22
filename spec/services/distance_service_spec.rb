require 'rails_helper'

RSpec.describe DistanceService do
  it 'can return the distance between two locations' do
    distance_service = DistanceService.new
    results = distance_service.get_distance('denver,co', 'pueblo,co')

    expect(results[:route]).to be_a(Hash)
    expect(results[:route][:realTime]).to be_a(Integer)
  end
end
