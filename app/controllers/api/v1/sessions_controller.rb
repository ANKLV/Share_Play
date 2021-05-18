# frozen_string_literal: true

module Api
  module V1
    class SessionsController < ApplicationController
      skip_before_action :authenticate_user!

      def create
        @user = User.find_by(email: params[:email])
        if @user
          if @user.authenticate(params[:password])
            @user.regenerate_auth_token
            render json: @user, status: :created
          else
            render json: { message: I18n.t('controllers.api.v1.sessions.creds') }, status: :unprocessable_entity
          end
        else
          render json: { message: I18n.t('controllers.api.v1.sessions.creds') }, status: :unprocessable_entity
        end
      end
    end
  end
end
