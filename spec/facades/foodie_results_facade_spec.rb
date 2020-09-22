require 'rails_helper'

RSpec.describe FoodieResultsFacade do
  before(:each) do
    start_place = 'denver,co'
    end_place = 'pueblo,co'
    search = 'italian'
    @foodie_results_facade = FoodieResultsFacade.new(@start, @end, @search)
  end

  it '#end_location' do
    expect(@foodie_results_facade.end_location).to eq(@end_place)
  end

  it '#travel_time' do
    expect(@foodie_results_facade.travel_time).to eq('1 hours 48 min')
  end

  it '#forecast' do
    expect(@foodie_results_facade.forecast).to be_a(Hash)
    expect(@foodie_results_facade.forecast).to have_key(:summary)
    expect(@foodie_results_facade.forecast).to have_key(:temperature)
  end

  it '#restaurant' do
    expect(@foodie_results_facade.restaurant).to be_a(Hash)
    expect(@foodie_results_facade.restaurant).to have_key(:name)
    expect(@foodie_results_facade.restaurant).to have_key(:address)
  end
end
