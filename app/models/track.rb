# frozen_string_literal: true

class Track < ApplicationRecord
  has_one_attached :audio

  validates :name, presence: true, on: :update

  before_create :set_artist

  def duration
    audio.blob.metadata[:duration] if audio.attached?
  end

  private

  def set_artist
    self.name = audio.blob.filename.to_s
  end
end
