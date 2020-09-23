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
      render json: user.error_message(user_params), status: 400
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
