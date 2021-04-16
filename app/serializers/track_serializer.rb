# frozen_string_literal: true

class TrackSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :name, :artist, :url, :duration

  def url
    rails_blob_url(object.audio) if object.audio.attached?
  end

  def duration
    Time.at(object.audio.blob.metadata[:duration]).strftime("%M:%S") if object.audio.attached?
  end
end
