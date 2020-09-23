class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: session_params[:email])
    if user && user.authenticate(params[:password])
      render json: UsersSerializer.new(user), status: 200
    end
  end

  def session_params
    params.permit(:email, :password)
  end
end
