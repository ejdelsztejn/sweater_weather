class FoodieResultsFacade
  attr_reader :start_place,
              :end_place,
              :search

  def initialize(start_place, end_place, search)
    @start_place = start_place
    @end_place   = end_place
    @search      = search
  end

  def end_location
    end_place
  end

  def travel_time
    distance_service = DistanceService.new
    time = distance_service.get_distance(start_place, end_place)
  end

  def forecast
  end

  def restaurant
  end
end
