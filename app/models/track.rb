# frozen_string_literal: true

class Track < ApplicationRecord
  validates :name, :artist, :duration, presence: true

  has_one_attached :file
end
