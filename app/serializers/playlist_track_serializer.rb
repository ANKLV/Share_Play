# frozen_string_literal: true

class PlaylistTrackSerializer < ActiveModel::Serializer
  attributes :id, :track_id, :playlist_id, :position
  belongs_to :track
end
