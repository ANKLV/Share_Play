# frozen_string_literal: true

class PlaylistsController < ApplicationController
  before_action :set_playlist, only: %i[show update destroy]

  def index
    @playslists = Playlist.all

    render json: @playslists
  end

  def show
    render json: @playslist
  end

  def create
    @playslist = Playlist.new(playslist_params)

    if @playslist.save
      render json: @playslist, status: :created, location: @playslist
    else
      render json: @playslist.errors, status: :unprocessable_entity
    end
  end

  def update
    if @playslist.update(playslist_params)
      render json: @playslist
    else
      render json: @playslist.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @Playlist.destroy
  end

  private

  def set_playlist
    @playslist.find(params[:title])
  end

  def playslist_params
    params.require(:playslist).permit(:title)
  end
end
