require 'bcrypt'

class User < ApplicationRecord
  has_many :subreddits, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :password, length: { minimum: 8 }, on: :create

  include BCrypt

  def password
    @password ||= Password.new(password_hash) if password_hash
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  private

  def user_email
    errors.add(:email, "must have an '@' and a '.'") if email && (!email.include?('@') || !email.include?('.'))
  end

  def user_password
    password_check = password.scan(/\d/).empty? || password.scan(/[a-zA-Z]/).empty?
    errors.add(:password, "must contain letters and numbers") if password && !password_check
  end
end
