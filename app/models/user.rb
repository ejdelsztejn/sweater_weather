class User < ApplicationRecord
  has_secure_password

  validates_presence_of :email, :api_key
  validates_uniqueness_of :email, :api_key

  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/

  before_validation :set_api_key

  def error_message(user_params)
    if self.invalid_email?
      { 'error': {'message': 'Valid email address required' }}
    elsif self.mismatched_passwords?(user_params)
      { 'error': {'message': 'Password and password confirmation must match' }}
    elsif self.email_taken?(user_params)
      { 'error': {'message': 'Email is already taken' }}
    end
  end

  def invalid_email?
    (self.email =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i).nil?
  end

  def mismatched_passwords?(user_params)
    user_params[:password] != user_params[:password_confirmation]
  end

  def email_taken?(user_params)
    User.where(email: user_params[:email]).empty? == false
  end

  private

  def set_api_key
    self.api_key = ApiKey.generator
  end
end
