require 'openssl'

class User < ApplicationRecord
  ITERATIONS = 20_000
  REGEX_EMAIL = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  REGEX_USERNAME = /\A\w+\z/.freeze
  DIGEST = OpenSSL::Digest::SHA256.new

  attr_accessor :password

  has_many :questions

  validates :email, :username, presence: true, uniqueness: true
  validates :email, format: { with: REGEX_EMAIL }
  validates :username, format: { with: REGEX_USERNAME }, length: { maximum: 40 }
  validates :password, presence: true, on: :create
  validates :password, confirmation: true

  before_save { username.downcase! }
  before_save :encrypt_password

  def self.hash_to_string(password_hash)
    password_hash.unpack('H*')[0]
  end

  def self.authenticate(email, password)
    user = find_by(email: email)

    return nil unless user.present?

    hashed_password = User.hash_to_string(
      OpenSSL::PKCS5.pbkdf2_hmac(
        password, user.password_salt, ITERATIONS, DIGEST.length, DIGEST
      )
    )

    return user if user.password_hash == hashed_password

    nil
  end

  private

  def encrypt_password
    if password.present?
      self.password_salt = User.hash_to_string(OpenSSL::Random.random_bytes(16))
      self.password_hash = User.hash_to_string(
        OpenSSL::PKCS5.pbkdf2_hmac(
          password, password_salt, ITERATIONS, DIGEST.length, DIGEST
        )
      )
    end
  end
end
