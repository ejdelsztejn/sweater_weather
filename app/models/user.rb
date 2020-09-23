class User < ApplicationRecord
  has_secure_password

  validates_presence_of :api_key
  validates_uniqueness_of :api_key

  before_validation :set_api_key

  private

  def set_api_key
    self.api_key = ApiKey.generator
  end
end
