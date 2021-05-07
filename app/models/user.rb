# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password :password_digest, validations: true
  has_many :tracks
  has_many :playlists

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :password_digest, presence: true, length: { minimum: 6, maximum: 50 }, unless: :persisted?
  validates :email, presence: true, length: {
    minimum: 5, maximum: 50
  }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
end
