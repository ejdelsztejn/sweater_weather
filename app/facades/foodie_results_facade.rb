class FoodieResultsFacade
  attr_reader :start_place,
              :end_place,
              :search,
              :forecast_info

  def initialize(start_place, end_place, search)
    @start_place     = start_place
    @end_place       = end_place
    @search          = search
    @forecast_info ||= ForecastFacade.new(end_place)
  end

  def end_location
    end_place
  end

  def travel_time
    distance_service ||= DistanceService.new
    time = distance_service.get_distance(start_place, end_place)
  end

  def forecast
    distance_service ||= DistanceService.new
    time = distance_service.get_realtime(start_place, end_place)
    now = DateTime.now.to_time.to_i.to_s
    time_at_arrival = DateTime.strptime((now + time).to_s,'%s').beginning_of_hour
    final_time = forecast_info.hourly_forecast.select do |f|
      time_at_arrival.beginning_of_hour == DateTime.strptime(f.dt.to_s,'%s')
    end
    {
      summary: "Cloudy",
      temperature: final_time.temp
    }
  end

  def restaurant
    coordinates = forecast_info.get_location[:coordinates]

    conn = Faraday.new(url: 'https://developers.zomato.com') do |req|
      req.params[:apikey] = ENV['ZOMATO_API_KEY']
    end
    response = conn.get("/api/v2.1/search?lat=#{coordinates[:lat]}&lon=#{coordinates[:lng]}&cuisines=#{foodie_params[:search]}")
    json = JSON.parse(response.body, symbolize_names: true)
    restaurant = json[:restaurants].find do |restaurant|
      restaurant[:restaurant][:cuisines].include?(foodie_params[:search].capitalize)
    end
    restaurant
  end
end
