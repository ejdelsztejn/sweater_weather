class DistanceService
  def get_distance(start_location, end_location)
    time = results(start_location, end_location)[:route][:formattedTime]
    "#{time.split(':')[0].to_i.to_s} hours #{time.split(':')[1].to_i.to_s} min"
  end

  def get_realtime(start_location, end_location)
    results(start_location, end_location)[:route][:realTime]
  end

  private

  def results(start_location, end_location)
    response = conn.get("/directions/v2/route?key=#{ENV['MAPQUEST_API_KEY']}&from=#{start_location}&to=#{end_location}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'http://www.mapquestapi.com')
  end
end
