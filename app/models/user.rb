# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password :password, validations: true
  validates_uniqueness_of :email
  has_many :tracks
  has_many :playlists
  has_secure_token :auth_token

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :password, presence: true, length: {
    minimum: 6, maximum: 50
  }, unless: :persisted?, confirmation: { case_sensitive: true }
  validates :email, presence: true, length: {
    minimum: 5, maximum: 50
  }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
end
