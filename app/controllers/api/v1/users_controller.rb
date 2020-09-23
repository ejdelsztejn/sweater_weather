class Api::V1::UsersController < ApplicationController
  def create
    User.create(
      email: user_params[:email],
      password: user_params[:password],
      password_confirmation: user_params[:password_confirmation]
    )


  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
