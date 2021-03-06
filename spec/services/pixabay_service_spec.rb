require 'rails_helper'

RSpec.describe PixabayService do
  it 'can return image data by location' do
    VCR.use_cassette('pixabay_service') do
      pixabay_service = PixabayService.new
      city = 'boston'
      results = pixabay_service.get_image_data(city)
      expect(results).to be_a(Hash)
    end
  end
end
