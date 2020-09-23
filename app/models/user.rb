class User < ApplicationRecord
  has_secure_password

  validates_presence_of :email, :api_key
  validates_uniqueness_of :email, :api_key

  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/

  before_validation :set_api_key

  def invalid_email?
    (self.email =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i).nil?
  end

  private

  def set_api_key
    self.api_key = ApiKey.generator
  end
end
