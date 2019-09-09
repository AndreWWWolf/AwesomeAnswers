class User < ApplicationRecord

  has_many :questions, dependent: :nullify
  has_many :answers, dependent: :nullify

  has_secure_password
  # Provides user authentication features on the model
  # it is called in. Requires a column named
  # 'password_digest' and the gem 'bcrypt'
  # - It will add two attribute accessors for 'password'
  # and 'password_confirmation'
  # It will add a presence validation for the 'password'
  # field
  # It will save passwords assigned to 'password' using
  # bcrypt to hash and store it in the 'password_digest'
  # column meaning that we will never store plain text
  # passwords.
  # It will add a method named 'authenticate' to verify
  # a user's password. If called with the correct password,
  # it will return the user. Otherwise, it will return
  # 'false'
  # The attribute accessor 'password_confirmation' is
  # optional. If it is present, a validation will be added
  # to verify that is identical to the 'password' accessor.

  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  validates :email, presence: true, uniqueness: true, format: VALID_EMAIL_REGEX

  def full_name
    "#{first_name} #{last_name}".strip
  end
end
