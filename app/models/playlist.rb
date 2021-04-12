# frozen_string_literal: true

class Playlist < ApplicationRecord
  has_many :playlist_tracks
  has_many :tracks, through: :playlist_tracks

  validates :title, presence: true
end
