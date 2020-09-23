require 'rails_helper'

RSpec.describe RoadTripFacade do
  before(:each) do
    @start_place = 'denver,co'
    @end_place = 'pueblo,co'
    @road_trip_facade = RoadTripFacade.new(@start_place, @end_place)
  end

  it '#travel_time' do
    expect(@road_trip_facade.travel_time).to eq('1 hours 43 min')
  end

  it '#forecast' do
    expect(@road_trip_facade.forecast).to be_a(Hash)
    expect(@road_trip_facade.forecast).to have_key(:summary)
    expect(@road_trip_facade.forecast).to have_key(:temperature)
  end
end
