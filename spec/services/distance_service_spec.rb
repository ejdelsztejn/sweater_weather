require 'rails_helper'

RSpec.describe DistanceService do
  it 'can return the distance between two locations' do
    distance_service = DistanceService.new
    results = distance_service.get_distance('denver,co', 'pueblo,co')

    expect(results).to be_a(Hash)
    expect(results[:realTime]).to be_a(Integer)
    expect(results[:realTime]).to be(6445)
  end
end
