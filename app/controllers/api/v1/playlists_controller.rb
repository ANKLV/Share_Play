# frozen_string_literal: true

module Api
  module V1
    class PlaylistsController < ApplicationController
      before_action :set_playlist, only: %i[show update destroy]

      def index
        @playlists = current_user.playlists

        render json: @playlists
      end

      def show
        render json: @playlist
      end

      def create
        @playlist = current_user.playlists.new(playlist_params)

        if @playlist.save
          render json: @playlist, status: :created
        else
          render json: @playlist.errors, status: :unprocessable_entity
        end
      end

      def update
        if current_user.playlists.update(playlist_params)
          render json: @playlist
        else
          render json: @playlist.errors, status: :unprocessable_entity
        end
      end

      def destroy
        if current_user.playlists.destroy
          head(:ok)
        else
          render json: @playlist.errors, status: :unprocessable_entity
        end
      end

      private

      def set_playlist
        @playlist = current_user.playlists.find(params[:id])
      end

      def playlist_params
        params.require(:playlist).permit(:title)
      end
    end
  end
end
