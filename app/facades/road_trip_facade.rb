class RoadTripFacade
  attr_reader :start_place,
              :end_place,
              :distance_service,
              :forecast_info


  def initialize(start_place, end_place)
    @start_place        = start_place.downcase
    @end_place          = end_place.downcase
    @distance_service ||= DistanceService.new
    @forecast_info    ||= ForecastFacade.new(end_place)
  end


  def travel_time
    distance_service.get_distance(start_place, end_place)
  end


  def forecast
    time = distance_service.get_realtime(start_place, end_place)
    now = DateTime.now.to_time.to_i
    time_at_arrival = DateTime.strptime((now + time).to_s,'%s').beginning_of_hour
    final_time = forecast_info.hourly_forecast.select do |f|
      time_at_arrival.beginning_of_hour == DateTime.strptime(f.dt.to_s,'%s')
    end.pop
    {
      summary: final_time.summary,
      temperature: final_time.temp
    }
  end

  def get_trip_details
    RoadTrip.new(start_place, end_place, travel_time, forecast)
  end
end
