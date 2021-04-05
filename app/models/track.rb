# frozen_string_literal: true

class Track < ApplicationRecord
  validates :name, :artist, presence: true

  has_one_attached :audio

  def duration
    audio.blob.metadata[:duration] if audio.attached?
  end
end
