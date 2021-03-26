# frozen_string_literal: true

class Playlist < ApplicationRecord
  has_many :tracks
end
