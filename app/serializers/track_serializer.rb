# frozen_string_literal: true

class TrackSerializer < ActiveModel::Serializer
  attributes :id, :name, :artist
end
