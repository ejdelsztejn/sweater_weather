class DistanceService
  def get_distance(start_location, end_location)
    response = conn.get("/directions/v2/route?key=#{ENV['MAPQUEST_API_KEY']}&from=#{start_location}&to=#{end_location}")
    results = JSON.parse(response.body, symbolize_names: true)
    time = results[:route][:formattedTime]
    "#{time.split(':')[0].to_i.to_s} hours #{time.split(':')[1].to_i.to_s} min"
  end

  private

  def conn
    Faraday.new(url: 'http://www.mapquestapi.com')
  end
end
