# frozen_string_literal: true

class TrackSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :name, :artist, :url

  def url
    rails_blob_url(object.audio)
  end
end
