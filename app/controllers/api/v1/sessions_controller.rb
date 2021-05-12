class Api::V1::SessionsController < ApplicationController

  def create
    @user = User.find_by(email: params[:email])
    if @user
      if @user.authenticate(params[:password])
        render json: @user, status: :created
      else
        render json: {message: 'invalid credentials'}, status: :unprocessable_entity
      end
    else
      render json: {message: 'invalid credentials'}, status: :unprocessable_entity
    end
  end
end
