class Api::V1::UsersController < ApplicationController
  def create
    user = User.create(
      email: user_params[:email],
      password: user_params[:password],
      password_confirmation: user_params[:password_confirmation]
    )
    if user.save
      render json: UsersSerializer.new(user), status: 201
    else
      if user.invalid_email?
        render json: { 'error': {'message': 'Valid email address required' }}, status: 400
      end
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
