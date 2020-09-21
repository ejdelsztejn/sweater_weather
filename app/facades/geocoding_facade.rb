class GeocodingFacade
  attr_reader :location,
              :service

  def initialize(location)
    @location = location
    @service  = GeocodingService.new
  end

  def find_lat_long
    lat_long_data = service.get_location_data(location)
    lat_long_data[:results].first[:locations].first[:latLng]
  end
end
