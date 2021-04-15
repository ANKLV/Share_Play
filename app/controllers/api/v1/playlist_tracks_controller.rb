# frozen_string_literal: true

module Api
  module V1
    class PlaylistTracksController < ApplicationController
      before_action :set_playlist_track, only: %i[show update destroy]

      def index
        @playlist_tracks = playlist.playlist_tracks

        render json: @playlist_tracks
      end

      def show
        render json: @playlist_track
      end

      def create
        @playlist_track = PlaylistTrack.new(playlist_track_params)

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

      def playlist
        @playlist ||= Playlist.find(params[:playlist_id])
      end

      def set_playlist_track
        @playlist_track = PlaylistTrack.find(params[:id])
      end

      def playlist_track_params
        params.require(:playlist_track).permit(:track_id, :playlist_id, :position)
      end
    end
  end
end
