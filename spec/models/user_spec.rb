require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'callbacks' do
    it 'will have an api_key automatically assigned when created' do
      user = User.create!(
        email: 'email',
        password: '123',
        password_confirmation: '123'
      )
      expect(user.api_key).to_not be_nil
    end
  end
end
