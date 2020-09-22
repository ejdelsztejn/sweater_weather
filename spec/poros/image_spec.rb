require 'rails_helper'

describe Image do
  it 'exists' do
    attrs = {
      largeImageUrl: "https://pixabay.com/get/53e5d24a4e56a914f6da8c7dda793676113ed8ed5a536c48732f7bdc9744c25cb0_1280.jpg",
      user: "Tama66",
    }

    image = Image.new(attrs)

    expect(image).to be_a Image
  end
end
