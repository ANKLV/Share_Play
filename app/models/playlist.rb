# frozen_string_literal: true

class Playlist < ApplicationRecord
  has_many :playlist_tracks, dependent: :destroy
  has_many :tracks, through: :playlist_tracks
  belongs_to :user

  validates :title, presence: true
end
