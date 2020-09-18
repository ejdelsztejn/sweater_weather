class GeocodingFacade
  attr_reader :location

  def initialize(location)
    @location = location
  end

  def find_lat_long
    lat_long_data = get_location_data
    get_location_data[:results].first[:locations].first[:latLng]
  end

  def get_location_data
    conn = Faraday.new('http://www.mapquestapi.com')

    response = conn.get("/geocoding/v1/address?key=#{ENV['MAPQUEST_API_KEY']}&location=#{location}")

    JSON.parse(response.body, symbolize_names: true)
  end
end
