module Api
  module V1
    class PlaylistTracksController < ApplicationController
      before_action :set_playlist, only: %i[show update destroy]

      def index
        @playlist_tracks = Playlist_track.all

        render json: @playlist_tracks
      end

      def show
        render json: @playlist_track
      end

      def create
        @playlist_track = Playlist_track.new(playlist_track_params)

        if @playlist_track.save
          render json: @playlist_track, status: :created
        else
          render json: @playlist_track.errors, status: :unprocessable_entity
        end
      end

      def update
        if @playlist_track.update(playlist_track_params)
          render json: @playlist_track
        else
          render json: @playlist_track.errors, status: :unprocessable_entity
        end
      end

      def destroy
        if @playlist_track.destroy
          head(:ok)
        else
          render json: @playlist_track.errors, status: :unprocessable_entity
        end
      end

      private

      def set_playlist_track
        @playlist_track = Playlist_track.find(params[:id])
      end

      def playlist_track_params
        params.require(:playlist_track).permit(:position)
      end
    end
  end
end
