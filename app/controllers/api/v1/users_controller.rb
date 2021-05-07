# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      def new
        @user = User.new
      end

      def create
        @user = User.create(user_auth_params)
        session[:user_id] = @user.id
        if @user.valid?
          render json: @user, status: :created
        else
          redirect_to '/users/new', alert: 'Invalid email or password'
        end
      end

      private

      def user_params
        params.require(:user).permit(:nickname)
      end

      def user_auth_params
        params.require(:user).permit(:email, :password)
      end
    end
  end
end
