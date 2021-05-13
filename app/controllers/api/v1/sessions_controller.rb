class Api::V1::SessionsController < ApplicationController
  def create
    @user = User.find_by(email: params[:email])
    if @user
      if @user.authenticate(params[:password])
        @user.regenerate_auth_token
        render json: @user, status: :created
      else
        render json: {message: 'invalid credentials'}, status: :unprocessable_entity
      end
    else
      render json: {message: 'invalid credentials'}, status: :unprocessable_entity
    end
  end

  # private
  #
  #   def authenticate
  #     authenticate_or_request_with_http_token do |token, options|
  #       User.find_by(token: token)
  #     end
  #   end
  #
  #   def current_user
  #     @current_user ||= authenticate
  #   end
end
