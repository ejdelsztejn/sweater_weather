class Image
  attr_reader :location,
              :image_url,
              :credit

  def initialize(location, image_data)
    @location  = location
    @image_url = image_data[:largeImageURL]
    @credit    = {
      source: "pixabay.com",
      author: image_data[:user],
      logo: "https://pixabay.com/static/img/logo_square.png"
    }
  end
end
