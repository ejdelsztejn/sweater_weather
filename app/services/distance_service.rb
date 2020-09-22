class DistanceService
  def get_distance(start_location, end_location)
    response = conn.get("/directions/v2/route?key=#{ENV['MAPQUEST_API_KEY']}&from=#{start_location}&to=#{end_location}")
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new(url: 'http://www.mapquestapi.com')
  end
end
