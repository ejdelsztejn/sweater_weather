class PixabayService
  def get_image_data(location)
    response = conn.get do |req|
      req.params[:q] = location
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def conn
    conn = Faraday.new("https://pixabay.com/api/") do |req|
      req.params["key"] = ENV["PIXABAY_API_KEY"]
    end
  end
end
