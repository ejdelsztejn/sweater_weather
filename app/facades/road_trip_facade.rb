class RoadTripFacade
  attr_reader :id,
              :start_place,
              :end_place,
              :search,
              :distance_service,
              :forecast_info


  def initialize(start_place, end_place, search)
    @start_place        = start_place
    @end_place          = end_place
    @search             = search
    @distance_service ||= DistanceService.new
    @forecast_info    ||= ForecastFacade.new(end_place)
  end


  def travel_time
    distance_service.get_distance(start_place, end_place)
  end


  def forecast
    time = distance_service.get_realtime(start_place, end_place)
    now = DateTime.now.to_time.to_i.to_s
    time_at_arrival = DateTime.strptime((now + time).to_s,'%s').beginning_of_hour
    final_time = forecast_info.hourly_forecast.select do |f|
      time_at_arrival.beginning_of_hour == DateTime.strptime(f.dt.to_s,'%s')
    end
    {
      summary: final_time.first.summary,
      temperature: final_time.temp
    }
  end
end
