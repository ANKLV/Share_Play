# frozen_string_literal: true

module Api
  module V1
    class TracksController < ApplicationController
      before_action :set_track, only: %i[show update destroy]

      def index
        @tracks = Track.all

        render json: @tracks
      end

      def show
        render json: @tracks
      end

      def create
        @track = Track.new(track_params)

        if @track.save
          render json: @track, status: :created
        else
          render json: @track.errors, status: :unprocessable_entity
        end
      end

      def update
        if @track.update(track_params)
          render json: @track
        else
          render json: @track.errors, status: :unprocessable_entity
        end
      end

      def destroy
        if @track.destroy
          head(:ok)
        else
          render json: @track.errors, status: :unprocessable_entity
        end
      end

      private

      def set_track
        @track = Track.find(params[:id])
      end

      def track_params
        params.require(:track).permit(:artist, :name, :duration)
      end
    end
  end
end
